// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

contract MoodNft is ERC721 {
    uint256 private s_tokenCounter;  //tokenId
    string private s_sadSvg;
    string private s_happySvg;

    constructor(string memory sadSvgImgUri, string memory happySvgImgUri) ERC721("Mood Nft", "MN"){
        s_tokenCounter = 0;
        s_sadSvg = sadSvgImgUri;
        s_happySvg = happySvgImgUri;
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter ); 
        s_tokenCounter++;
    }

    function tokenUri(uint256 tokenId) public view override returns(string memory) {


    }
}