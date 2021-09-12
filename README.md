# README



## usersテーブル

|Column                |Type       |Options    |
|------ ---------------|-----------|-----------|
|nick_name             |string     |null: false|
|email                 |string     |null: false|
|encrypted_password    |string     |null: false|
|full_width_first_name |string     |null: false|
|first_name_kana       |string     |null: false|
|full_width_last_name  |string     |null: false|
|last_name_kana        |string     |null: false|
|birthday              |date       |null: false|

has_many : items
has_many : purchases


## itemsテーブル

|Column|Type|Options|
|-----------------|--------------|------------------------------|
|item_name        |string        |null: false                   |
|explain          |text          |null: false                   |
|price            |integer       |null: false                   |
|category_id      |integer       |null: false                   |
|state_id         |integer       |null: false                   |
|items postage_id |integer        |null: false                   |
|prefecture_id    |integer       |null: false                   |
|date_id          |integer        |null: false                   |
|user             |references    |null: false,foreign_key: true |

belongs_to : user
has_one    : purchase

## purchasesテーブル

|Column        |Type       |Options                       |
|item          |references |null: false,foreign_key: true |
|user          |references |null: false,foreign_key: true |


belongs_to : user
belongs_to : item
has_one    : address

## addressesテーブル

|Column          |Type       |Options                       |
|postal_code     |string     |null: false                   |
|prefecture_id   |integer    |null: false                   |
|city            |string     |null: false                   |
|house_number    |string     |null: false                   |
|building_name   |string     |                              |
|telephone_number|string  |null: false                   |
|purchase        |references |null: false,foreign_key: true |


belongs_to : purchase

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
