# README
簡易的なECサイト
機能一覧
- アイテム一覧表示機能
- アイテム詳細表示機能
- カート機能
- 決済機能

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
