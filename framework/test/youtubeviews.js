var YoutubeViews = artifacts.require("./YoutubeViews.sol");

contract('YoutubeViews', function(accounts) {
  

 it("should have 370 Aufrufe views [ASYNC]", async function() {
    
    let meta = await YoutubeViews.deployed();
    let views = await meta.viewsCount.call();
   // console.log('ASYNC views fetch - '+ views)
    assert.equal(views.valueOf().toString(), '370 Aufrufe', "10000 wasn't in the first account")
  });
  
});
