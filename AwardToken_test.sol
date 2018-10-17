pragma solidity ^0.4.24;
import "./AwardToken.sol";

contract AwardTokenTest {
    AwardToken awtkn;

    function beforeAll() {
        awtkn = new AwardToken();
    }

    function addressShouldNotBe_0x000() public constant returns (bool) {
        address zro = 0x0000000000000000000000000000000000000000;
        return Assert.notEqual(address(awtkn), zro, "address should not be 0");
    }

    function totalSupplyShouldBe_0() public constant returns (bool) {
        return Assert.equal(awtkn.totalSupply(), 0, "total supply should be 0");
    }

    function startRoundShouldReturn_true() public constant returns (bool) {
        return Assert.equal(awtkn.startRound(), true, "startRound return is false");
    }

    // TODO: implement greaterThan function
    /* function balanceShouldBe_100() public constant returns (bool) {
        address to = 0xe60667640C07E654E37b7082aE4E629cb0a7605f;
        address(awtkn).call.gas(70000).value(0)("mint",[to, 100]);
        return Assert.equal(awtkn.balanceOf(to), 100, "balance should be 100");
    } */
    function ownerShouldBeTester() public constant returns (bool) {
        address tester = this;
        return Assert.equal(awtkn.owner(), tester, "owner should be tester");
    }
}
