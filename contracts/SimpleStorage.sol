// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;


 contract SimpleStorage {
        uint256 public favoriteNumber;

        // 创建一个Mapping
        mapping(string => uint256 ) public nameToFavoriteNumber;
        mapping(uint256 => string) public favoriteNumberToName;



        // People public person = People({favoriteNumber: 2, name: "Mike"}); // 创建一个实例，默认传入参数

        // 创建数组的别的方式：[] 动态数组，长度随意； [ 5 ] 创建长度为5的固定长度数组
        People[] public people ;
//      创建一个新人实例，并且使用重构的构造函数赋值
//         创建构造函数
        function addPerson(string memory _name, uint256 _hisFavoriteNumber) public{
            People memory newPerson = People({favoriteNumber: _hisFavoriteNumber, name: _name }); // 使用原生构造函数初始化一个，并且赋值
            people.push(newPerson);

            // 高阶写法
            // people.push(People({favoriteNumber: _hisFavoriteNumber, name： _name}));

            // 结合Mapping,
            nameToFavoriteNumber [_name] = _hisFavoriteNumber;
            favoriteNumberToName [_hisFavoriteNumber] = _name;

        }


        function store(uint256 _favoriteNumber) public {
            favoriteNumber = _favoriteNumber;
            // uint256 testVar = 5;

        }


        // function something() public{
        //     testVar = 6;
        // }


        // view 和 pure 修饰，只要不是在合约内被别的function调用，则不会产生Gas
        function retrieve() public view returns(uint256){
            return favoriteNumber;
        }

        struct People{
            uint256 favoriteNumber;
            string name; 
        }

// for test commitment of github




 }