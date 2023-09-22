# README

## 前提

- dockerが必要です。

## setup

```
docker compose build
```

```
docker compose run --rm web bin/setup
```


```
docker compose run --rm web yarn install
```

## run

```
docker compose up
```

http://localhost:3000

## rubocop
```
docker compose run --rm web bundle exec rubocop -A
```

## htmlbeautifier

```
docker compose run --rm web bin/htmlbeautifier
```
