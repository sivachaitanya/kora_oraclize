Steps to run the 2 node cluster inside the docker container - 

Pre-requisites : Docker, Node, C++ and Python

Note - If some point during build if there are any errors related to make is undefined as such please execute the following command inside the docker container - 


apk --no-cache add --virtual native-deps \
  g++ gcc libgcc libstdc++ linux-headers make python && \
  npm install --quiet node-gyp -g &&\
  npm install --quiet && \
  apk del native-deps


1. Execute the command "docker-compose build"
2. Execute the command "docker-compose up"

Executing step 2 should bring up 2 node cluster which creates a merkle dag and starts producing the blocks

Unlocking Accounts - 

1. Execute "geth attach ipc:/root/.ethereum/devchain/geth.ipc" to launch geth console
2. Execute "personal.unlockAccount(eth.accounts[9],'',0);
3. Execute "personal.unlockAccount(eth.accounts[0],'',0);

Deploying Ethereum bridge contracts - 

Navigate to /root/oracle/ethere-bridge folder

1. Execute "node bridge -H localhost:8545 -a 9 --oar 0x504F250B8908F0eCB341a798614e63074ba78ec7
2. Leave this terminal open to accept incoming queries from private chain