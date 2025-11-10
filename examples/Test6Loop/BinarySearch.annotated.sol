// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.7.0;

contract BinarySearch {

    uint[] a;

    /// @notice precondition _elem >= 0
    function find(uint _elem) public view returns (uint index) {

        // Binary search
        uint bIndex = a.length;
        uint left = 0;
        uint right = a.length;

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
