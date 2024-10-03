// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

// Write a StudentPortal smart contract where only the owner can register students into the smart contract.

// Only the owner can update and delete students records.

// Write other functions that will return students records

// Student records includes, but not limited to:
// Name, email, date of birth, lga, country, state


contract studenPortal {
    struct Student {
        string name;
        string email;
        string dob;
        string lga;
        string country;
        string state;
    }

    Student[] students;
    address owner;
    // constructor {
    //     owner = msg.sender
    // }
    constructor() {
        owner = msg.sender;
    }
    event studentAdded();
    event studentUpdated();
    event studentDeleted();

    modifier onlyOwner (){
        require (msg.sender == owner, "Not owner of the contract");
        _;
    }

    //Function to register student 
    function registerStudent (string memory _name,
     string memory _email, 
     string memory _dob, 
     string memory _lga, 
     string memory _country,
      string memory _state)  external {
     require(msg.sender == owner, "You are not owner");
        students.push(Student ({
            name: _name,
            email:_email,
            dob:_dob,
            lga:_lga,
            state:_state,
            country:_country
        }));
        emit studentAdded();
      }

      function getStudents(uint _i) external view returns (Student memory) {
        require(msg.sender == owner, "You are not owner");
        require(_i <= students.length -1, "Out of bound");
        return students[_i];
      }


      function updateStudents(uint _i, string memory _name,
       string memory _email, 
       string memory _dob,
        string memory _lga, 
        string memory _state, 
        string memory _country )  external {
        require(msg.sender == owner, "You are not owner");
        require(_i <= students.length -1, "Out of bound");
        Student storage st = students[_i];
        st.name = _name;
        st.email = _email;
        st.dob = _dob;
        st.lga = _lga;
        st.state = _state;
        st.country = _country;

         emit studentUpdated();

      }

      function deleteStudent (uint256 _i) external {
        require(msg.sender == owner, "You are not the owner of this contract.");
        require(_i <= students.length - 1, "Index out of bound.");
        for (uint i = _i; i < students.length - 1; i++) {
            students[_i] = students[i + 1];
        }
        students.pop();
        emit studentDeleted();
    }




}