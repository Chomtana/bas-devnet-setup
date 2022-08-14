docker build -t bas-genesis-config ./genesis
rm -rf ./genesis.json
envsubst < config.json > tmp_config.json
docker run --rm -v ${PWD}/tmp_config.json:/config.json -t bas-genesis-config /config.json > ./genesis.json
rm -f tmp_config.json

envsubst < docker-compose-bootnode.template.yaml > docker-compose-bootnode.yaml
envsubst < docker-compose-rpc.template.yaml > docker-compose-rpc.yaml
envsubst < docker-compose-validator.template.yaml > docker-compose-validator.yaml