# テーブル設計

## users テーブル

| Column    | Type    | Options     |
| --------- | ------- | ----------- |
| nickname  | string  | null: false |
| email     | string  | null: false |
| password  | string  | null: false |
| lastname  | string  | null: false |
| firstname | string  | null: false |
| lastkana  | string  | null: false |
| firstkana | string  | null: false |
| birthday  | integer | null: false |

## Association

- has_many :buys
- has_many :items

## itemsテーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| title       | string     | null: false                    |
| description | text       | null: false                    |
| category    | string     | null: false                    |
| status      | string     | null: false                    |
| shipping    | string     | null: false                    |
| area        | string     | null: false                    |
| day         | integer    | null: false                    |
| user        | references | null: false, foreign_key: true |

## Association

- belongs_to :user
- belongs_to :buy

## buysテーブル

| Column         | Type       | Options            |
| -------------- | ---------- | ------------------ |
| user_id        | references | foreign_key: true  |
| item_id        | references | foreign_key: true  |

## Association

- belongs_to :user
- belongs_to :item

## addressテーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| postal         | integer | null: false |
| prefectures    | string  | null: false |
| municipalities | string  | null: false |
| address        | string  | null: false |
| buildingname   | string  |             |
| phone          | integer | null: false |

## Association

- belongs_to :buy
