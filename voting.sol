pragma solidity ^0.4.18;
// Solidity version

contract Voting {
	/* group comment 
	*/
	
	
	mapping (bytes32 => uint8) public votesReceived;
	bytes32[] public candidateList;
	
	
	// Constructor to initalize all candidates to be voted
	function Voting(bytes32[] candidateNames) public {
		candidateList = candidateNames;
	}
	
	// A function to count the number of votes for a particular candidate
	function totalVotesFor(bytes32 candidate) view public returns (uint8) {
		require(validCandidate(candidate));
		return votesReceived[candidate];
	}
	
	function voteForCandidate(bytes32 candidate) public {
		require(validCandidate(candidate));
		votesReceived[candidate] += 1;
	}
	
	
	// Function to validate a candidate
	function validCandidate(bytes32 candidate) view public returns (bool) {
		for(uint i = 0; i < candidateList.length; i++) {
			if (candidateList[i] == candidate) {
				return true;
			}
		}
		return false;
	}
	
	
	
}