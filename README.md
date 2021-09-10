# README



## usersテーブル

|Column                |Type       |Options    |
|------ ---------------|-----------|-----------|
|nick_name             |string     |null: false|
|email                 |string     |null: false|
|password              |string     |null: false|
|password confirmation |string     |null: false|
|full_width_first_name |string     |null: false|
|kana_first_name       |string     |null: false|
|full_width_last_name  |string     |null: false|
|kana_last_name        |string     |null: false|
|birthday              |date       |null: false|

has_many : items
has_many : purchases
has_one  : addresse


## itemsテーブル

|Column|Type|Options|
|------------|--------------|-----------------------------|
|item_name   |string        |null: false                  |
|explain     |text          |null: false                  |
|price       |integer       |null: false                  |
|category_id |integer       |null: false                  |
|state_id    |integer       |null: false                  |
|user        |references    |null: false,foreign_key: true|

belongs_to : user
has_one    : purchase
has_one    : addresse

## purchasesテーブル

|Column        |Type       |Options                       |
|items postage |string     |null: false                   |
|area          |integer    |null: false                   |
|date          |string     |null: false                   |
|item          |references |null: false,foreign_key: true |
|user          |references |null: false,foreign_key: true |

belongs_to : user
belongs_to : item

## addressesテーブル

|Column        |Type       |Options                       |
|postal_code   |string     |null: false                   |
|prefecture    |integer    |null: false                   |
|city          |string     |null: false                   |
|house_number  |string     |null: false                   |
|building_name |string     |null: false                   |
|user          |references |null: false,foreign_key: true |
|item          |references |null: false,foreign_key: true |

belomgs_to : user
belongs_to : item

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
