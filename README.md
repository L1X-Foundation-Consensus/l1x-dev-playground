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

## Locally spin up a node

* Export environment variables
```bash
export REPLICATION_ENABLED=false
export IS_LOCAL=true
export NODE_PRIVKEY=6913aeae91daf21a8381b1af75272fe6fae8ec4a21110674815c8f0691e32758
```

* Initialize the genesis configuration
```bash
./l1x_server init
```

* Starts a local node with logs
```bash
RUST_LOG=info ./l1x_server start
``` 


## CLI usage

```sh
export PRIV_KEY=6d657bbe6f7604fb53bc22e0b5285d3e2ad17f64441b2dc19b648933850f9b46
```
* Prints options
```bash
./l1x_cli
```

* Payload Examples
```bash
./l1x_cli payload-examples
```

## Submit transactions using `cli`

Getter examples
```bash
./l1x_cli --rpc-type json --private-key $PRIV_KEY transaction-receipt --hash 6427c422661cf8cea0547a11ebb811813704dfd5c3ea934b60192bd9f74eaa2b
./l1x_cli --rpc-type json --private-key $PRIV_KEY block-by-number --block-number 1400
./l1x_cli --private-key $PRIV_KEY transactions-by-account -a 75104938baa47c54a86004ef998cc76c2e616289 --number-of-transactions 3 --starting-from 0
```

# submit transactions, requires creation of a payload inside config json file
```bash
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/native_token_transfer.json
```

# smart contract related, pass in contract_address to init, contract_instance_address to function_call
```bash
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/smart_contract_deployment.json

```

# Take the address from server logs:
"*******EXECUTING CONTRACT DEPLOYMENT******** : "80441bd7201609434b89e2712840cf88ef0c8ec2" "

./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/smart_contract_init.json
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/smart_contract_function_call.json

# For example, with the L1X Fungible Token smart contract
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/ft_smartcontract/deployment.json
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/ft_smartcontract/init.json
./l1x_cli --private-key $PRIV_KEY read-only-func-call --payload-file-path txn-payload/ft_smartcontract/ft_name.json

# xtalk smart contract related, pass in contract_address to init, contract_instance_address to function_call
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/xtalk_smart_contract_deployment.json
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/xtalk_smart_contract_init.json
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/xtalk_smart_contract_function_call.json

# evm smart contract related, pass in contract_instance_address to function_call. Note, there's no "init" step
./l1x_cli --private-key $PRIV_KEY submit-sol --payload-file-path txn-payload/evm_smart_contract_deployment.json
# Take the address from server logs:
"*******EXECUTING EVM CONTRACT DEPLOYMENT******** : "80441bd7201609434b89e2712840cf88ef0c8ec2" "
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/evm_smart_contract_function_call.json


# staking related, pass the pool address to stake/un_stake
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/create_staking_pool.json
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/stake.json
./l1x_cli --private-key $PRIV_KEY submit-txn --payload-file-path txn-payload/un_stake.json

```
