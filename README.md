# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Pitari

## Get start
```
mkdir -p ~/work
cd ~/work
https://github.com/chubachi-pt-2019/pitari.git
cd pitari
```

## Run server
```
docker-compose up -d
```

## Run migrate
```
docker exec -it pitari_app_1 bash
rails db:drop
rails db:create
rails db:migrate
```

## Show page
```
http://0.0.0.0:3000
```