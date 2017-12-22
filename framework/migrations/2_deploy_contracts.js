var Storage = artifacts.require("./Storage.sol");
var YoutubeViews = artifacts.require("./YoutubeViews.sol");
module.exports = function(deployer) {
  deployer.deploy(Storage);
  deployer.deploy(YoutubeViews);
};