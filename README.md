# Pitari

## Get start
```
mkdir -p ~/work
cd ~/work
https://github.com/chubachi-pt-2019/pitari.git
cd pitari
```

## Run server

- For Production

```
docker-compose up -d
```

- For Mac or Linux

```
docker-compose -f docker-compose-dev_mac_linux.yaml up -d
```

- For Windows

```
docker-compose -f docker-compose-dev_windows.yaml up -d
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
