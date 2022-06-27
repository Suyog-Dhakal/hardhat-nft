// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.8.7;
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "base64-sol/base64.sol";

contract DynamicSvgNft is ERC721 {
    //mint
    //store our SVG information somewhere
    //some logic to say "Show X image" or "show Y image"

    uint256 private s_tokenCounter;
    string private i_lowImageURI;
    string private i_highImageURI;
    string private constant base64EncodedSvgPrefix =
        "data:image/svg+xml;base64,"

    constructor(string memory lowSvg, string memory highDvg)
        ERC721("Dynamic SVG NFT", "DSN")
    {
        s_tokenCounter = 0;
    }

    function svgToImageURI() public pure returns (string memory) {
        string memory svgBase64Encoded = base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return
            string(abi.encodePacked(base64EncodedSvgPrefix, svgBase64Encoded));
    }

    function mintNft() public {
        _safeMint(msg.sender, s_tokenCounter);
        s_tokenCounter += 1;
    }
    
}

//23;02