// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

contract Test {
    function ifElseTest(uint _number) public pure returns(bool) {
        return _number % 2 == 0;
    }

    function forLoopTest(uint count) public pure returns(uint) {
        uint sum = 0;
        for (uint i = 1; i <= count; i++) {
            sum += i;
        }
        return sum;
    }

    function whileTest(uint count) public pure returns(uint) {
        uint sum = 0;
        uint i = 0;
        while (i <= count) {
            sum += i++;
        }
        return sum;
    }

    function doWhileTest(uint count) public pure returns(uint) {
        uint sum = 0;
        uint i = 0;
        do {
            sum += i++;
        } while (i <= count);
        return sum;
    }

    function ternaryText(uint x, uint y) public pure returns(uint) {
        return x >= y ? x : y;
    }

    // function insertionSort(uint[] memory a) public pure returns(uint[] memory) {
    //     // note that uint can not take negative value
    //     for (uint i = 1;i < a.length;i++){
    //         uint temp = a[i];
    //         uint j=i;
    //         while( (j >= 1) && (temp < a[j-1])){
    //             a[j] = a[j-1];
    //             j--;
    //         }
    //         a[j] = temp;
    //     }
    //     return(a);
    // }

    function insertionSortWrong(uint[] memory arr) public pure returns(uint[] memory) {
        for (uint i = 0; i < arr.length - 1; i++){
            for (uint j = 0; j < arr.length - 1 - i; j++) {
                if (arr[j] > arr[j + 1]) {
                    uint temp = arr[j];
                    arr[j] = arr[j + 1];
                    arr[j + 1] = temp;
                }
            }
        }
        return(arr);
    }
}
