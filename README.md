# simplebank

## How to install go-migrate in Ubuntu
```bash
curl https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key --keyring /usr/share/keyrings/cloud.google.gpg add -

curl -s https://packagecloud.io/install/repositories/golang-migrate/migrate/script.deb.sh | sudo bash

sudo apt-get update

sudo apt-get install migrate
```

## Migrate Create
```bash
migrate create -ext sql -dir db/migration -seq init_schema
```

## Migrate
```bash
migrate -path db/migration -database "postgresql://root:secret@localhost:5432/simple_bank?sslmode=disable" -verbose up
```

## Show tables
```bash
docker exec -it postgres17.4 psql -U root -d simple_bank
```
then
```psql
\dt
```

## Install sqlc
Run the following command to see if /snap/bin is in your PATH:
```bash
echo $PATH
```

For zsh, add the following line to your ~/.zshrc file:
```bash
export PATH=$PATH:/snap/bin
```
Restart shell

## Init sqlc
```bash
sqlc init
```