// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;


contract GasOptim {
    //Optimizations:
    //replace memory with calldata
    //load state variable to memory
    //replace for loo i++ with ++i
    //cache array elements
    //short circuit


uint public total;
function sumIfEvenAndLessThan99(uint[] memory nums) external{
    //not gas optimized

 
    for (uint i = 0; i< nums.length; i += 1){
        bool isEven = nums[i] % 2 == 0;
        bool isLessThan99 = nums[i] < 99;
        if(isEven && isLessThan99){
            total += nums[i];
        }

    }
}


function sumIfEvenAndLess2Than99(uint[] calldata nums) external {
       uint _total = total;
       uint len = nums.length;

       for (uint i=0; i < len; i = unchecked_inc(i)) {
           uint num = nums[i];
           if(num % 2 == 0 && num < 99) {
               _total += num;
           }
       }
       total = _total;
}
 function unchecked_inc(uint i) internal pure returns(uint){
      unchecked {
        ++i;
      }
      return i;
    }    
}


