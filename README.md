# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  6.0.0
* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

## users テーブル

| Column           | Type     | Options     |
| ---------------- | -------- | ----------- |
| nickname         | string   | null: false |
| family_name      | string   | null: false |
| first_name       | string   | null: false |
| family_name_kana | string   | null: false |
| first_name_kana  | string   | null: false |
| email            | string   | null: false |
| password         | string   | null: false |
| birthday         | date     | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type    | Options           |
| ----------- | ------- | ----------------- |
| item_name   | string  | null: false       |
| description | text    | null: false       |
| category    | string  | null: false       |
| condition   | string  | null: false       |
| send_cost   | string  | null: false       |
| territory   | string  | null: false       |
| send_days   | string  | null: false       |
| price       | integer | null: false       |
| user_id     | integer | foreign_key: true |

### Association

- belongs_to :user
- has_one :buy

## buys テーブル

| Column          | Type    | Options           |
| --------------- | ------- | ----------------- |
| card_number     | integer | null: false       |
| expiration_date | date    | null: false       |
| security_code   | integer | null: false       |
| postal_code     | integer | null: false       |
| prefecture      | string  | null: false       |
| municipality    | string  | null: false       |
| address         | string  | null: false       |
| building_name   | string  | null: false       |
| phone_number    | integer | null: false       |
| item_id         | integer | foreign_key: true |
| user_id         | integer | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user