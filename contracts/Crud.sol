pragma solidity >=0.4.16 <0.8.0;

contract Crud {
    struct User {
        uint256 id;
        string name;
    }

    uint256 public nextId = 1;
    mapping(uint256 => string) public Users;

    constructor() public {}

    function Create(string memory _name) public {
        Users[nextId] = _name;
        nextId++;
    }

    function Read(uint256 _id) public view returns (uint256, string memory) {
        return (_id, Find(_id));
    }

    function Update(uint256 _id, string memory _name) public {
        Find(_id);
        Users[_id] = _name;
    }

    function Delete(uint256 _id) public {
        Find(_id);
        delete Users[_id];
    }

    function Find(uint256 _id) internal view returns (string memory) {
        string memory _name = Users[_id];
        bytes memory val = bytes(_name);
        if (val.length == 0) {
            revert("User does not exist!");
        } else return _name;
    }
}
