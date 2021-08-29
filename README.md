# テーブル設計

## users テーブル

| Column                           | Type   | Options                   |
| -------------------------------- | ------ | ------------------------- |
| nickname                         | string | null: false               |
| email                            | string | null: false, unique: true |
| encrypted_password               | string | null: false               |
| last_name                        | string | null: false               |
| first_name                       | string | null: false               |
| last_name_furigana               | string | null: false               |
| first_name_furigana              | string | null: false               |
| birthday                         | date   | null: false               |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column                 | Type         | Options          |
| ---------------------- | ------------ | -----------      |
| title                  | string       | null: false      |
| description            | text         | null: false      |
| category_id            | integer      | null: false      |
| status_id              | integer      | null: false      |
| shipping_charge_id     | integer      | null: false      |
| area_id                | integer      | null: false      |
| send_date_id           | integer      | null: false      |
| price                  | integer      | null: false      |
| user                   | references   | foreign_key:true |

### Association

- has_one    :buyer
- belongs_to :user

## buyers テーブル

| Column                   | Type       | Options          |
| ------------------------ | ---------- | ---------------- |
| user                     | references | foreign_key:true |
| item                     | references | foreign_key:true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Column              | Type       | Options          |
| ------------------- | ---------- | ---------------- |
| postal_code         | string     | null: false      |
| area_id             | integer    | null: false      |
| municipalities      | string     | null: false      |
| number_address      | string     | null: false      |
| building_name       | string     | -----------      |
| phone_number        | string     | null: false      |
| buyer               | references | foreign_key:true |

### Association

- belongs_to :buyer