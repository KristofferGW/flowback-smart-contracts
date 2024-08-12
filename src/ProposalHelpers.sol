// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.18;

import {PollHelpers} from './PollHelpers.sol';

contract ProposalHelpers is PollHelpers {

    struct Proposal {
        string description;
        uint voteCount;
        uint proposalId;
        uint predictionCount;
        uint score;
    }

    //Ties proposals to polls by pollId
    mapping(uint => Proposal[]) public proposals;

    function requireProposalToExist (uint _pollId, uint _proposalId) internal view returns (bool) {
        uint proposalsLength = proposals[_pollId].length;
        for (uint i = 0; i < proposalsLength; i++) {
            if (proposals[_pollId][i].proposalId == _proposalId) {
                return true;
            }
        }
        return false;
    }
}