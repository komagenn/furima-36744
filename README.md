# README



## userテーブル

|Column                |Type       |Options    |
|------ ---------------|-----------|-----------|
|nick_name             |string     |null: false|
|email                 |string     |null: false|
|password              |string     |null: false|
|password confirmation |string     |null: false|
|full_width_name       |string     |null: false|
|katakana_name         |string     |null: false|
|birthday              |date       |null: false|



## itemsテーブル

|Column|Type|Options|
|-----------|--------------|-----------------------------|
|item_name  |string        |null: false                  |
|image      |ActiveStorage |null: false                  |
|explain    |text          |null: false                  |
|price      |integer       |null: false                  |
|category   |string        |null: false                  |
|state      |string        |null: false                  |
|user       |references    |null: false,foreign_key: true|

## purchaseテーブル

|Column        |Type       |Options                       |
|items postage |string     |null: false                   |
|area          |integer    |null: false                   |
|date          |string     |null: false                   |
|item          |references |null: false,foreign_key: true |
|user          |references |null: false,foreign_key: true |



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
