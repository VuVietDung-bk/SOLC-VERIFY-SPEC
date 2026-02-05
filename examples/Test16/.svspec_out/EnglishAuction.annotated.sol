// SPDX-License-Identifier: MIT

pragma solidity >=0.7.0;


/// @title Reduced ERC721 (NFT)
contract ERC721Mock {
    // Ownership of tokens token-id -> owner
    mapping(uint256 => address) private ownership;
  
    function transferFrom(
        address from,
        address to,
        uint256 tokenId
    ) external {
        require(ownership[tokenId] == from);
        ownership[tokenId] = to;
    }
}


/// @title Reduced ERC20 (token)
contract ERC20Mock {
    mapping(address => uint256) private balances;

    function transferFrom(
        address from,
        address to,
        uint amount
    ) external returns (bool) {
        if (balances[from] < amount) {
            return false;
        }
        balances[from] -= amount;
        balances[to] += amount;
        return true;
    }
}


/// @title English auction for NFT
/// @notice invariant forall (address bidder) bids[bidder] <= highestBid
/// @notice invariant highestBidder == address(0) || bids[highestBidder] == highestBid
contract EnglishAuction {
    event Start();
    event Bid(address indexed sender, uint amount);
    event Withdraw(address indexed bidder, uint amount);
    event End(address winner, uint amount);

    ERC721Mock public nft;  // The auctioned NFT
    ERC20Mock public token;  // Accepted token for bidding
    uint public nftId;

    address payable public seller;  // The seller of the NFT
    uint public endAt;
    bool public started;
    bool public ended;

    address public highestBidder;
    uint public highestBid;
    mapping(address => uint) public bids;
    mapping(address => mapping(address => bool)) public operators;

    /// @param _nft the auctioned NFT
    /// @param _erc20 the token to be used for bidding
    /// @param _startingBid minimal bid value
    /// @notice precondition nftId >= 0
    /// @notice precondition endAt >= 0
    /// @notice precondition highestBid >= 0
    /// @notice precondition forall (address extraVar0) bids[extraVar0] >= 0
    /// @notice precondition _nftId >= 0
    /// @notice precondition _startingBid >= 0
    constructor(
        address _nft,
        address _erc20,
        uint _nftId,
        uint _startingBid
    ) {
        nft = ERC721Mock(_nft);
        nftId = _nftId;

        token = ERC20Mock(_erc20);

        seller = payable(msg.sender);
        highestBid = _startingBid;
    }

    /// Start the auction
    /// @notice precondition nftId >= 0
    /// @notice precondition endAt >= 0
    /// @notice precondition highestBid >= 0
    /// @notice precondition forall (address extraVar0) bids[extraVar0] >= 0
    function start() external {
        require(!started, "started");
        require(!ended, "started");
        require(msg.sender == seller, "not seller");
        
        started = true;
        nft.transferFrom(msg.sender, address(this), nftId);
        endAt = block.timestamp + 7 days;

        emit Start();
    }

    /// Set or unset trusted operator for sender. The trusted operator can withdraw
    /// bidder's funds.
    /// @notice precondition nftId >= 0
    /// @notice precondition endAt >= 0
    /// @notice precondition highestBid >= 0
    /// @notice precondition forall (address extraVar0) bids[extraVar0] >= 0
    function setOperator(address operator, bool trusted) external {
        operators[msg.sender][operator] = trusted;
    }

    /// @notice precondition nftId >= 0
    /// @notice precondition endAt >= 0
    /// @notice precondition highestBid >= 0
    /// @notice precondition forall (address extraVar0) bids[extraVar0] >= 0
    /// @notice precondition amount >= 0
    function bid(uint amount) external {
        _bid(msg.sender, msg.sender, amount);
    }

    /// Send tokens to increase the bid of `bidder` 
    /// @notice precondition nftId >= 0
    /// @notice precondition endAt >= 0
    /// @notice precondition highestBid >= 0
    /// @notice precondition forall (address extraVar0) bids[extraVar0] >= 0
    /// @notice precondition amount >= 0
    function bidFor(address bidder, uint amount) external {
        _bid(bidder, msg.sender, amount);
    }

    /// Bidding implementation.
    /// @dev Funds are transferred from `payer` to support the bid of `bidder`.
    function _bid(address bidder, address payer, uint amount) internal {
        require(started, "not started");
        require(block.timestamp < endAt, "ended");
        uint previousBid = highestBid;
        
        require(
            token.transferFrom(payer, address(this), amount),
            "token transfer failed"
        );

        bids[bidder] += amount;
        highestBidder = bidder;
        highestBid = bids[highestBidder];

        require(bids[highestBidder] > previousBid, "new high value > highest");
        emit Bid(bidder, amount);
    }

    /// Withdraw implementation.
    /// @dev Bid of `bidder` is reduced and funds are sent to the `recipient`.
    function _withdraw(address bidder, address recipient, uint256 amount) internal {
        require(bidder != highestBidder, "bidder cannot withdraw");
        bids[bidder] -= amount;

        bool success = token.transferFrom(address(this), recipient, amount); 
        require(success, "token transfer failed");

        emit Withdraw(bidder, amount);
    }
    
    /// Withdraw entire bid.
    /// @notice precondition nftId >= 0
    /// @notice precondition endAt >= 0
    /// @notice precondition highestBid >= 0
    /// @notice precondition forall (address extraVar0) bids[extraVar0] >= 0
    function withdraw() external {
        _withdraw(msg.sender, msg.sender, bids[msg.sender]);
    }

    /// Reduce sender's bid amount, transferring the funds to recipient.
    /// @notice precondition nftId >= 0
    /// @notice precondition endAt >= 0
    /// @notice precondition highestBid >= 0
    /// @notice precondition forall (address extraVar0) bids[extraVar0] >= 0
    /// @notice precondition amount >= 0
    function withdrawAmount(address recipient, uint amount) external {
        _withdraw(msg.sender, recipient, amount);
    }

    /// Reduce bid of `bidder`, transferring funds to message sender.
    /// @notice message sender must be a trusted operator or the bidder.
    /// @notice precondition nftId >= 0
    /// @notice precondition endAt >= 0
    /// @notice precondition highestBid >= 0
    /// @notice precondition forall (address extraVar0) bids[extraVar0] >= 0
    /// @notice precondition amount >= 0
    function withdrawFor(address bidder, uint amount) external {
        require(
          operators[bidder][msg.sender] || msg.sender == bidder,
          "that operator was not allowed"
        );
        _withdraw(bidder, msg.sender, amount);
    }

    /// End the auction, transfer the NFT to the winning bidder, and the highest bid
    /// amount to the seller.
    /// @notice If there is no winner, the seller receives the NFT and not tokens.
    /// @notice precondition nftId >= 0
    /// @notice precondition endAt >= 0
    /// @notice precondition highestBid >= 0
    /// @notice precondition forall (address extraVar0) bids[extraVar0] >= 0
    function end() external {
        require(started, "not started");
        require(block.timestamp >= endAt, "not ended");
        require(!ended, "ended");
        bool _success;

        ended = true;
        if (highestBidder != address(0)) {
            nft.transferFrom(address(this), highestBidder, nftId);
            _success = token.transferFrom(address(this), seller, bids[highestBidder]);
            require(_success, "token transfer failed");
        } else {
            nft.transferFrom(address(this), seller, nftId);
        }

        emit End(highestBidder, highestBid);
    }

}
