# テーブル設計

## users テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| nickname       | string | null: false |
| email          | string | null: false |
| password       | string | null: false |
| お名前(全角)     | string | null: false |
| お名前カナ(全角)  | string | null: false |
| 生年月日         | string | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :comments

## items テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| image      | string | null: false |
| 商品名      | string | null: false |
| 商品の説明  | string | null: false |
| カテゴリー  | string | null: false |
| 商品の状態  | string | null: false |
| 配送料の負担 | string | null: false |
| 発送元の地域 | string | null: false |
| 発送日の目安 | string | null: false |
| 価格        | string | null: false |

### Association

- belongs_to :users
- has_many :orders
- has_many :comments

## orders テーブル

| Column         | Type   | Options     |
| -------------- | ------ | ----------- |
| カード情報       | string | null: false |
| 有効期限         | string | null: false |
| セキュリティコード | string | null: false |
| 郵便番号         | string | null: false |
| 都道府県         | string | null: false |
| 市区町村         | string | null: false |
| 番地            | string | null: false |
| 建物名           | string | null: false |
| 電話番号         | string | null: false |

### Association

- belongs_to :users
- belongs_to :items

## comments テーブル

| Column     | Type   | Options     |
| ---------- | ------ | ----------- |
| text       | string | null: false |

- belongs_to :users
- belongs_to :items

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
