# テーブル設計

## users テーブル

| Column            | Type   | Options                  |
| ----------------- | ------ |------------------------- |
| nickname          | string | null: false              |
| email             | string | null: false, unique: true|
| encrypted_password| string | null: false              |
| sei               | string | null: false              |
| mei               | string | null: false              |
| kana_sei          | string | null: false              |
| kana_mei          | string | null: false              |
| birthday          | date   | null: false              |

### Association

- has_many :items
- has_many :user_items


## items テーブル

| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| name               | string   | null: false                    |
| description        | text     | null: false                    |
| category_id        | integer  | null: false                    |
| condition_id       | integer  | null: false                    |
| shipping_burden_id | integer  | null: false                    |
| shipping_area_id   | integer  | null: false                    |
| shipping_date_id   | integer  | null: false                    |
| price              | integer  | null: false                    |
| user               | reference| null: false, foreign_key: true |

- _idのつくinteger Typeは、アクティブハッシュを使用する。
### Association

- belongs_to :user
- has_one :user_item


## user_items テーブル

| Column        | Type     | Options                        |
| ------------- | -------- |------------------------------- |
| user          | reference| null: false, foreign_key: true |
| item          | reference| null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one : delivery

## deliveries テーブル

| Column           | Type     | Options                        |
| ---------------- | -------- |------------------------------- |
| zip_code         | string   | null: false                    |
| shipping_area_id | integer  | null: false                    |
| municipalities   | string   | null: false                    |
| address          | string   | null: false                    |
| building         | string   |                                |
| tel              | string   | null: false                    |
| user_item        | reference| null: false, foreign_key: true |

### Association

- belongs_to :user_item
