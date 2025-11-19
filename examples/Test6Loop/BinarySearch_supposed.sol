// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0;

/// @notice invariant forall (uint i, uint j) !(0 <= i && i < a.length && 0 <= j && j < a.length) || (i >= j || a[i] < a[j])
contract BinarySearch {

    uint[] a;

    /// @notice precondition _elem >= 0
    /// @notice postcondition forall (uint i) !(0 <= i && i < a.length) || (a[i] != _elem || i == index)
    function find(uint _elem) public view returns (uint index) {

        // Binary search
        uint bIndex = a.length;
        uint left = 0;
        uint right = a.length;

        /// @notice invariant (0 <= left) && (left <= right) && (right <= a.length)
        /// @notice invariant forall (uint i) !(0 <= i && i < a.length) || (i >= left || a[i] < _elem)
        /// @notice invariant forall (uint i) !(0 <= i && i < a.length) || (i < right || _elem < a[i])
        while (left < right) {
            uint m = (left + right) / 2;
            if (a[m] == _elem) {
                bIndex = m;
                break;
            } else if (a[m] > _elem) {
                right = m;
            } else {
                left = m;
            }
        }
        // If _elem was found, index should be in bIndex.
        assert(left >= right || a[bIndex] == _elem);

        // Linear search
        uint lIndex = 0;
        bool found = false;
        /// @notice invariant (0 <= lIndex) && (lIndex <= a.length)
        /// @notice invariant forall (uint i) !(0 <= i && i < a.length) || (i >= lIndex || a[i] != _elem)
        /// @notice invariant !found || a[lIndex] == _elem
        while (!found && lIndex < a.length) {
            if (a[lIndex] == _elem) {
                found = true;
            } else {
                ++lIndex;
            }
        }
        // If _elem was found, index should be in lIndex.
        assert(!found || a[lIndex] == _elem);

        assert(lIndex == bIndex);

        return bIndex;
    }
}
