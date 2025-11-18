/**
 *Submitted for verification at Etherscan.io on 2018-02-11
*/

// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

interface ERC20 {
	//ERC-20 Token Standard https://github.com/ethereum/EIPs/blob/master/EIPS/eip-20-token-standard.md

	function name() external view returns (string memory);
	function symbol() external view returns (string memory);
	function decimals() external view returns (uint8);
	function totalSupply() external view returns (uint256);
	function balanceOf(address _owner) external view returns (uint256);
	function transfer(address _to, uint256 _value) external returns (bool success);
	function transferFrom(address _from, address _to, uint256 _value) external returns (bool success);
	function approve(address _spender, uint256 _value) external returns (bool success);
	function allowance(address _owner, address _spender) external view returns (uint256);

	event Transfer(address indexed _from, address indexed _to, uint256 _value);
	event Approval(address indexed _owner, address indexed _spender, uint256 _value);
}

interface TokenRecipient {
	function receiveApproval(address _from, uint256 _value, address _token, bytes calldata _extraData) external;
}

interface ERC223Receiver {
  function tokenFallback(address _from, uint256 _value, bytes calldata _data) external;
}

abstract contract ERC223 is ERC20 {
	//ERC223 token standard https://github.com/Dexaran/ERC223-token-standard

	function transfer(address _to, uint256 _value, bytes memory _data) public virtual returns (bool success);
	function transfer(address _to, uint256 _value, bytes memory _data, string memory _customFallback) public virtual returns (bool success);

	event Transfer(address indexed _from, address indexed _to, uint256 _value, bytes _data);
}

contract NGToken is ERC223 {
	string constant private NAME 			= "NEO Genesis Token";
	string constant private SYMBOL	 		= "NGT";
	uint8 constant private DECIMALS 		= 18;
	uint256 constant private INITIAL_SUPPLY	= 20000000000 * (10 ** uint256(DECIMALS));
	uint256 private totalBurned				= 0;
	mapping(address => uint256) private balances;
	mapping(address => mapping(address => uint256)) private allowed;

	constructor() {
	  balances[msg.sender] = INITIAL_SUPPLY;
	}

	//ERC20
	function name() public pure override returns (string memory) {
		return NAME;
	}

	function symbol() public pure override returns (string memory) {
		return SYMBOL;
	}

	function decimals() public pure override returns (uint8) {
		return DECIMALS;
	}

	function totalSupply() public view override returns (uint256) {
		return INITIAL_SUPPLY - totalBurned;
	}

	function balanceOf(address _owner) public view override returns (uint256) {
		return balances[_owner];
	}

	function transfer(address _to, uint256 _value) public override returns (bool success) {
		if (isContract(_to)) {
			bytes memory empty;
			return transferToContract(_to, _value, empty);
		} else {
			require(_to != address(0x0));
			require(balances[msg.sender] >= _value);
			balances[msg.sender] -= _value;
			balances[_to] += _value;
			emit Transfer(msg.sender, _to, _value);
			// Transfer(msg.sender, _to, _value, _data);
		}
		return true;
	}

	function multipleTransfer(address[] memory _to, uint256 _value) public returns (bool success) {
		require(_value * _to.length > 0);
		require(balances[msg.sender] >= _value * _to.length);
		balances[msg.sender] -= _value * _to.length;
		for (uint256 i = 0; i < _to.length; ++i) {
		 	balances[_to[i]] += _value;
		 	emit Transfer(msg.sender, _to[i], _value);
		}
		return true;
	}

	function batchTransfer(address[] memory _to, uint256[] memory _value) public returns (bool success) {
		require(_to.length > 0);
		require(_value.length > 0);
		require(_to.length == _value.length);
		for (uint256 i = 0; i < _to.length; ++i) {
			address to = _to[i];
			uint256 value = _value[i];
			require(balances[msg.sender] >= value);
			balances[msg.sender] -= value;
		 	balances[to] += value;
		 	emit Transfer(msg.sender, to, value);
		}
		return true;
	}

	function transferFrom(address _from, address _to, uint256 _value) public override returns (bool success) {
		require(_to != address(0x0));
    require(balances[_from] >= _value && allowed[_from][msg.sender] >= _value);
    balances[_from] -= _value;
    balances[_to] += _value;
		allowed[_from][msg.sender] -= _value;
    emit Transfer(_from, _to, _value);
		bytes memory empty;
		emit Transfer(_from, _to, _value, empty);
    return true;
	}

	function approve(address _spender, uint256 _value) public override returns (bool success) {
		//https://docs.google.com/document/d/1YLPtQxZu1UAvO9cZ1O2RPXBbT0mooh4DYKjA_jp-RLM/
		//force to 0 before calling "approve" again
		require((_value == 0) || (allowed[msg.sender][_spender] == 0));

		allowed[msg.sender][_spender] = _value;
		emit Approval(msg.sender, _spender, _value);
		return true;
	}

    function approveAndCall(address _spender, uint256 _value, bytes memory _extraData) public returns (bool success) {
      TokenRecipient spender = TokenRecipient(_spender);
      if (approve(_spender, _value)) {
        spender.receiveApproval(msg.sender, _value, address(this), _extraData);
        return true;
      }
		  return false;
    }

	function increaseApproval(address _spender, uint256 _addValue) public returns (bool) {
		allowed[msg.sender][_spender] += _addValue;
		emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
		return true;
	}

	function decreaseApproval(address _spender, uint256 _subValue) public returns (bool) {
		if (_subValue > allowed[msg.sender][_spender]) {
		  allowed[msg.sender][_spender] = 0;
		} else {
		  allowed[msg.sender][_spender] -= _subValue;
		}
		emit Approval(msg.sender, _spender, allowed[msg.sender][_spender]);
		return true;
	}

	function allowance(address _owner, address _spender) public view override returns (uint256) {
		return allowed[_owner][_spender];
	}

	//ERC233
	function transfer(address _to, uint256 _value, bytes memory _data) public override returns (bool success) {
		if (isContract(_to)) {
			return transferToContract(_to, _value, _data);
		} else {
			return transferToAddress(_to, _value, _data);
		}
	}

	function transfer(address _to, uint256 _value, bytes memory _data, string memory _customFallback) public override returns (bool success) {
		if (isContract(_to)) {
			require(_to != address(0x0));
			require(balances[msg.sender] >= _value);
			balances[msg.sender] -= _value;
			balances[_to] += _value;
      (bool ok,) = _to.call{value: 0}(abi.encode(bytes4(keccak256(abi.encode(_customFallback))), msg.sender, _value, _data));
			assert(ok);
			emit Transfer(msg.sender, _to, _value);
			emit Transfer(msg.sender, _to, _value, _data);
			return true;
		} else {
			return transferToAddress(_to, _value, _data);
		}
	}

  function transferToAddress(address _to, uint256 _value, bytes memory _data) private returns (bool success) {
		require(_to != address(0x0));
	 	require(balances[msg.sender] >= _value);
	 	balances[msg.sender] -= _value;
	 	balances[_to] += _value;
	 	emit Transfer(msg.sender, _to, _value);
	 	emit Transfer(msg.sender, _to, _value, _data);
	  return true;
  }

  function transferToContract(address _to, uint256 _value, bytes memory _data) private returns (bool success) {
	  require(_to != address(0x0));
	  require(balances[msg.sender] >= _value);
	  balances[msg.sender] -= _value;
	  balances[_to] += _value;
	  ERC223Receiver receiver = ERC223Receiver(_to);
	  receiver.tokenFallback(msg.sender, _value, _data);
    emit Transfer(msg.sender, _to, _value);
    emit Transfer(msg.sender, _to, _value, _data);
    return true;
  }

	function isContract(address _addr) private view returns (bool) {
    // if (_addr == address(0x0))
		// 	return false;
    uint256 length;
    assembly {
      length := extcodesize(_addr)
    }
		return (length > 0);
  }

	//Burn
  event Burn(address indexed burner, uint256 value, uint256 currentSupply, bytes data);

  function burn(uint256 _value, bytes memory _data) public returns (bool success) {
		require(balances[msg.sender] >= _value);
		balances[msg.sender] -= _value;
		totalBurned += _value;
		emit Burn(msg.sender, _value, totalSupply(), _data);
		return true;
  }

  function burnFrom(address _from, uint256 _value, bytes memory _data) public returns (bool success) {
		if (transferFrom(_from, msg.sender, _value)) {
			return burn(_value, _data);
		}
    return false;
  }

	function initialSupply() public pure returns (uint256) {
		return INITIAL_SUPPLY;
	}

	function currentBurned() public view returns (uint256) {
		return totalBurned;
	}

	//Stop
	receive () external payable {
    require(false);
  }
}
