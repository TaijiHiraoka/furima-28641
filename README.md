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

| Column    | Type     | Options     |
| --------- | -------- | ----------- |
| nick_name | string   | null: false |
| name      | string   | null: false |
| email     | string   | null: false |
| password  | string   | null: false |
| birthday  | datetime | null: false |

### Association

- has_many :items
- has_many :buys

## items テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| image       | string  | null: false |
| item_name   | string  | null: false |
| description | text    | null: false |
| send_way    | string  | null: false |
| plice       | integer | null: false |
| user_id     | integer | null: false |

### Association

- belongs_to :user
- has_one :buys

## buys テーブル

| Column      | Type    | Options     |
| ----------- | ------- | ----------- |
| address     | string  | null: false |
| pay_way     | string  | null: false |
| item_id     | integer | null: false |
| user_id     | integer | null: false |

### Association

- belongs_to :item
- belongs_to :user