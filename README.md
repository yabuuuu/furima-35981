# テーブル設計

## users テーブル

| Column            | Type   | Options         |
| ----------------- | ------ |---------------- |
| nickname          | string | null: false     |
| email             | string | null: false     |
| encrypted_password| string | null: false     |
| sei               | string | null: false     |
| mei               | string | null: false     |
| kana_sei          | string | null: false     |
| kana_mei          | string | null: false     |
| birthday_yy       | integer| null: false     |
| birthday_mm       | integer| null: false     |
| birthday_dd       | integer| null: false     |

### Association

- has_many :cards
- has_many :items


## items テーブル

| Column             | Type     | Options                        |
| ------------------ | -------- | ------------------------------ |
| image              |          | ActiveStorage                  |
| name               | string   | null: false                    |
| description        | text     | null: false                    |
| category_id        | integer  | null: false                    |
| condition_id       | integer  | null: false                    |
| shipping_burden_id | integer  | null: false                    |
| shipping_area_id   | integer  | null: false                    |
| shipping_date_id   | integer  | null: false                    |
| price              | integer  | null: false                    |
| user_id            | reference| null: false, foreign_key: true |

- _idのつくinteger Typeは、アクティブハッシュを使用する。
### Association

- belongs_to :user
- belongs_to :card


## cards テーブル

| Column           | Type     | Options                        |
| ---------------- | -------- |------------------------------- |
| card_number      | integer  | null: false                    |
| expiration_month | integer  | null: false                    |
| expiration_year  | integer  | null: false                    |
| security_code    | integer  | null: false                    |
| user_id          | reference| null: false, foreign_key: true |
| item_id          | reference| null: false, foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one : delivery

## deliveries テーブル

| Column         | Type     | Options                        |
| -------------- | -------- |------------------------------- |
| zip_code       | integer  | null: false                    |
| prefectures    | string   | null: false                    |
| municipalities | string   | null: false                    |
| address        | integer  | null: false                    |
| building       | string   |                                |
| tel            | integer  | null: false                    |
| card_id        | reference| null: false, foreign_key: true |

### Association

- belongs_to :card
