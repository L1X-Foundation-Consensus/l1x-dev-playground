# L1X developers playground

Utility to provide CLI commands to the node.

## Setup

Cassandra reset/(re)start - perform reset when need to clear out tables.

```sh
# reset
docker kill l1x-cassandra && docker rm l1x-cassandra && docker container prune -f && docker volume prune -f
# run cassandra
docker run --name l1x-cassandra -d -p 9042:9042 -e CASSANDRA_CLUSTER_NAME=l1x-cassandra cassandra
```

Start a node(/rpc_json):

```sh
export REPLICATION_ENABLED=false
# in dev mode, bootstraps alice, bob & charlie accounts
RUST_LOG=info ./l1x_server --dev
```

## CLI usage

```sh
export RUST_LOG=info
export PRIV_KEY=6d657bbe6f7604fb53bc22e0b5285d3e2ad17f64441b2dc19b648933850f9b46

* prints options
./cli

* View payload examples
./cli payload-examples

// submit transactions, requires creation of a payload inside config json file
// note, node address currently hard coded to [2u8; 20]
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/native_token_transfer.json

// smart contract related, pass in contract_address to init, contract_instance_address to function_call
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/smart_contract_deployment.json
// Take the address from server logs:
"*******EXECUTING CONTRACT DEPLOYMENT******** : "80441bd7201609434b89e2712840cf88ef0c8ec2" "

./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/smart_contract_init.json
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/smart_contract_function_call.json

// For example, with the L1X Fungible Token smart contract
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/ft_smartcontract/deployment.json
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/ft_smartcontract/init.json
./cli --private-key $PRIV_KEY read-only-func-call --payload-file-path txn-payload/ft_smartcontract/ft_name.json

// xtalk smart contract related, pass in contract_address to init, contract_instance_address to function_call
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/xtalk_smart_contract_deployment.json
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/xtalk_smart_contract_init.json
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/xtalk_smart_contract_function_call.json

// evm smart contract related, pass in contract_instance_address to function_call. Note, there's no "init" step
./cli --private-key $PRIV_KEY submit-sol --payload-file-path txn-payload/evm_smart_contract_deployment.json
// Take the address from server logs:
"*******EXECUTING EVM CONTRACT DEPLOYMENT******** : "80441bd7201609434b89e2712840cf88ef0c8ec2" "
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/evm_smart_contract_function_call.json


// staking related, pass the pool address to stake/un_stake
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/create_staking_pool.json
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/stake.json
./cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/un_stake.json
```
