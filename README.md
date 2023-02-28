# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| last_name          | string | null: false |
| first_name         | string | null: false |
| last_name_kana     | string | null: false |
| first_name_kana    | string | null: false |
| birthday           | date   | null: false |

## items テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| name          | string     | null: false                    |
| content       | text       | null: false                    |
| price         | integer    | null: false                    |
| condition     | text       | null: false                    |
| shipping_fee  | integer    | null: false                    |
| shipping_area | string     | null: false                    |
| days_left     | integer    | null: false                    |
| category      | string     | null: false                    |
| user          | references | null: false, foreign_key: true |

## orders テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| item   | references | null: false, foreign_key: true |

## addresses テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture    | string     | null: false                    |
| municipality  | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     | null: false                    |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |