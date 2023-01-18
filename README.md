# README

## usersテーブル

| Column             | Type    | Options                   |
|--------------------|---------|---------------------------|
| nickname           | string  | null: false, unique: true |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| family_name        | string  | null: false               |
| first_name         | string  | null: false               |
| family_name_kana   | string  | null: false               |
| first_name_kana    | string  | null: false               |
| birthday_yy        | integer | null: false               |
| birthday_mm        | integer | null: false               |
| birthday_dd        | integer | null: false               |

### Association
- has_many :items
- has_many :orders


## itemsテーブル

| Column              | Type       | Options                       |
|---------------------|------------|-------------------------------|
| name                | string     | null: false                   |
| price               | integer    | null: false                   |
| description         | text       | null: false                   |
| category_id         | integer    | null: false                   |
| condition_id        | integer    | null: false                   |
| shipping_fee_id     | integer    | null: false                   |
| shipping_address_id | integer    | null: false                   |
| shipping_day_id     | integer    | null: false                   |
| user                | references | null: false, foreign_key: true| 

### Association
- belongs_to :user
- has_one :order


## ordersテーブル

| Column | Type       | Options                       |
|--------|------------|-------------------------------|
| user   | references | null: false, foreign_key: true|
| item   | references | null: false, foreign_key: true| 

### Association
- belongs_to :user
- belongs_to :item
- has_one :destination


## destinationsテーブル

| Column        | Type      | Options                        |
|---------------|-----------|--------------------------------|
| post_cord     | string    | null: false                    |
| prefecture_id | integer   | null: false                    |
| city          | string    | null: false                    |
| house_number  | string    | null: false                    |
| building_name | string    |                                |
| phone_number  | string    | null: false                    |
| order         | reference | null: false, foreign_key: true |

### Association
- belongs_to :order

## commentsテーブル
| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| text   | text       | null: false                    |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item