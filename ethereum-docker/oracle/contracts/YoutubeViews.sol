pragma solidity ^0.4.0;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";
contract YoutubeViews is usingOraclize {

    uint public viewsCount;

    function YoutubeViews() {
       OAR = OraclizeAddrResolverI(0x890D7d9f651adE5E6f8a9055dC18443Ef8619f5b);      //add this line once using Oraclize in private chain environment
        update(0);
    }

    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        viewsCount = parseInt(result, 0);
        // do something with viewsCount
        // (like tipping the author once viewsCount > X?)
        update(60*10); // update viewsCount every 10 minutes
    }

    function update(uint delay) {
        oraclize_query(delay, 'URL', 'html(https://www.youtube.com/watch?v=9bZkp7q19f0).xpath(//*[contains(@class, "watch-view-count")]/text())');
    }

}

contract WolframAlpha is usingOraclize {
    
    string public temperature;
    
    event newOraclizeQuery(string description);
    event newTemperatureMeasure(string temperature);

    function WolframAlpha() {
        OAR = OraclizeAddrResolverI(0x890D7d9f651adE5E6f8a9055dC18443Ef8619f5b);
        update();
    }
    
    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        temperature = result;
        newTemperatureMeasure(temperature);
        // do something with the temperature measure..
    }
    
    function update() payable {
        newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
        oraclize_query("WolframAlpha", "temperature in London");
    }
    
} 



pragma solidity ^0.4.0;
import "github.com/oraclize/ethereum-api/oraclizeAPI.sol";

contract YoutubeViews is usingOraclize {
    
    string public viewsCount;
    bytes32 public rvalue;
    
    event newOraclizeQuery(string description);
    event newYoutubeViewsCount(string views);
    event completed(string m);

    function YoutubeViews() {
         OAR = OraclizeAddrResolverI(0x890D7d9f651adE5E6f8a9055dC18443Ef8619f5b); 
        update();
    }
    
    function __callback(bytes32 myid, string result) {
        if (msg.sender != oraclize_cbAddress()) throw;
        viewsCount = result;
        newYoutubeViewsCount(viewsCount);
        // do something with viewsCount. like tipping the author if viewsCount > X?
        rvalue = myid;
        completed('Completed in callback');
    }
    
    function update() payable {
        newOraclizeQuery("Oraclize query was sent, standing by for the answer..");
        oraclize_query('URL', 'html(https://www.youtube.com/watch?v=ckeJkAw2v_Y).xpath(//*[contains(@class, "watch-view-count")]/text())');
        completed('Completed in update');
        
    }
    
} 