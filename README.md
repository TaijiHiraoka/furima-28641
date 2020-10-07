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
- has_many :buy_controls

## items テーブル

| Column        | Type    | Options           |
| ------------- | ------- | ----------------- |
| name          | string  | null: false       |
| description   | text    | null: false       |
| category_id   | integer | null: false       |
| condition_id  | integer | null: false       |
| send_cost_id  | integer | null: false       |
| prefecture_id | integer | null: false       |
| send_days_id  | integer | null: false       |
| price         | integer | null: false       |
| user_id       | integer | foreign_key: true |

### Association

- has_one :buy_control
- belongs_to :user

## addresses テーブル

| Column          | Type    | Options           |
| --------------- | ------- | ----------------- |
| postal_code     | string  | null: false       |
| prefecture_id   | integer | null: false       |
| municipality    | string  | null: false       |
| address         | string  | null: false       |
| building_name   | string  |                   |
| phone_number    | string  | null: false       |
| buy_controls_id | integer | foreign_key: true |

### Association

- belongs_to :buy_control

## buy_controls テーブル

| Column          | Type    | Options           |
| --------------- | ------- | ----------------- |
| user_id         | integer | foreign_key: true |
| item_id         | integer | foreign_key: true |

### Association

- has_one :address
- belongs_to :user
- belongs_to :item