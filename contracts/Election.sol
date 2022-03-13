// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22;


contract Election {
  
  struct Candidate {
    uint id;
    string name;
    uint voteCount;
  }

  mapping(uint => Candidate) public candidates;
  uint public candidateCount;

  mapping(address => bool) public voters;

  //event
  event voted(
    uint indexed candidateId
  );



  constructor() public {
    addCandidate("candidate 1");
    addCandidate("candidate 2");
 }

 function addCandidate(string memory name) private{
   candidateCount += 1;
   candidates[candidateCount] = Candidate(candidateCount, name, 0);
 }

  function vote(uint candidateId) public {
    require(candidateId <= candidateCount, "candidate id should be smaller or equal to candidate count");
    require(voters[msg.sender] == false , "voter need not yet vote");
    voters[msg.sender] = true;
    candidates[candidateId].voteCount +=1;

    //emit vote event
    emit voted(candidateId);
  }
 
}

