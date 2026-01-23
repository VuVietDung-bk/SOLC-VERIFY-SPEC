pragma solidity >=0.7.0;

contract Class {

    struct Student {
        string name;
        uint8 age;
    }

    Student[] public students;

    function createStudent(string memory _name, uint8 _age) public {
        students.push(Student(_name, _age));
    }
  
    function amountOfStudents() public view returns(uint count) {
        return students.length;
    }

}
