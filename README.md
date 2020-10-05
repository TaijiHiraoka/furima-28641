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

- has_many :buy_controls

## items テーブル

| Column      | Type    | Options           |
| ----------- | ------- | ----------------- |
| item_name   | string  | null: false       |
| description | text    | null: false       |
| category    | string  | null: false       |
| condition   | integer | null: false       |
| send_cost   | integer | null: false       |
| territory   | integer | null: false       |
| send_days   | integer | null: false       |
| price       | integer | null: false       |

### Association

- has_one :buy_control

## buys テーブル

| Column          | Type    | Options           |
| --------------- | ------- | ----------------- |
| postal_code     | string  | null: false       |
| prefecture      | string  | null: false       |
| municipality    | string  | null: false       |
| address         | string  | null: false       |
| building_name   | string  |                   |
| phone_number    | integer | null: false       |

### Association

- has_one :buy_control

## buy_controls テーブル

| Column          | Type    | Options           |
| --------------- | ------- | ----------------- |
| user_id         | integer | foreign_key: true |
| item_id         | integer | foreign_key: true |
| buy_id          | integer | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :buy