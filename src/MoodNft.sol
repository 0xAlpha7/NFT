// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {ERC721} from "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract MoodNft is ERC721 {
    uint256 private s_tokenCounter;  //tokenId
    string private s_sadSvgImgUri;
    string private s_happySvgImgUri;

    enum Mood{
        SAD, 
        HAPPY
    }

    mapping(uint256 tokenId => Mood) private s_tokenIdToMood; 

    constructor(string memory sadSvgImgUri, string memory happySvgImgUri) ERC721("Mood Nft", "MN"){
        s_tokenCounter = 0;
        s_sadSvgImgUri = sadSvgImgUri;
        s_happySvgImgUri = happySvgImgUri;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter ); 
        s_tokenIdToMood[s_tokenCounter] = Mood.HAPPY;
        s_tokenCounter++;
    }

    function _baseURI() internal pure override {
        
    }

    function tokenURI(uint256 tokenId) public view override returns(string memory) {
        string memory imageUri;

        if(s_tokenIdToMood[tokenId] == Mood.HAPPY){
            imageUri = s_happySvgImgUri;
        }
        else{
            imageUri = s_sadSvgImgUri;
        }

        Base64.encode(
        bytes(abi.encodePacked('{"name": "', name(), '", "description": "An nft that reflects the owners mood.", "attributes": [{"trait_type": "moodiness", "value": "100}], "image": "', imageUri, '"}')));


    }
}