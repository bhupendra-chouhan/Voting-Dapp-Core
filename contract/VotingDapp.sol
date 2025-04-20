// SPDX-License-Identifier: MIT
pragma solidity >=0.7.10;

contract MinimalVoting {
    address public owner;
    string[] public candidates;
    mapping(uint => uint) public votes;
    mapping(address => bool) public hasVoted;

    constructor(string[] memory _candidates) {
        owner = msg.sender;
        candidates = _candidates;
    }

    function vote(uint candidateIndex) external {
        require(!hasVoted[msg.sender], "Already voted");
        require(candidateIndex < candidates.length, "Invalid candidate index");

        votes[candidateIndex]++;
        hasVoted[msg.sender] = true;
    }

    function getVotes() external view returns (uint[] memory) {
        uint[] memory result = new uint[](candidates.length);
        for (uint i = 0; i < candidates.length; i++) {
            result[i] = votes[i];
        }
        return result;
    }
}
