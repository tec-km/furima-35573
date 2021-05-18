# テーブル設計

## users テーブル

| Column    | Type   | Options     |
| --------- | ------ | ----------- |
| nickname  | string | null: false |
| email     | string | null: false |
| password  | string | null: false |
| lastname  | string | null: false |
| firstname | string | null: false |
| lastkana  | string | null: false |
| firstkana | string | null: false |
| birthday  | date   | null: false |

## Association

- has_many :buys
- has_many :items

## itemsテーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| title         | string     | null: false                    |
| description   | text       | null: false                    |
| category_id   | integer    | null: false                    |
| condition_id  | integer    | null: false                    |
| shipping_id   | integer    | null: false                    |
| prefecture_id | integer    | null: false                    |
| day_id        | integer    | null: false                    |
| user          | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- has_one :buy

## buysテーブル

| Column         | Type       | Options            |
| -------------- | ---------- | ------------------ |
| user           | references | foreign_key: true  |
| item           | references | foreign_key: true  |

## Association

- belongs_to :user
- belongs_to :item

## addressテーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal         | integer | null: false |
| prefectures_id | string  | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| buildingname   | string  |             |
| phone          | string  | null: false |

## Association

- belongs_to :buy
