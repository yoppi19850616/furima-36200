# テーブル設計

## users テーブル

| Column                           | Type   | Options     |
| -------------------------------- | ------ | ----------- |
| nickname                         | string | null: false |
| email                            | string | null: false |
| encrypted_password               | string | null: false |
| name                             | string | null: false |
| japan_name                       | string | null: false |
| birthday                         | string | null: false |

### Association

- has_many :items
- has_many :buyers

## items テーブル

| Column                 | Type         | Options     |
| ---------------------- | ------------ | ----------- |
| image                  | ------------ | null: false |
| title                  | string       | null: false |
| description            | text         | null: false |
| category_id            | integer      | null: false |
| status_id              | integer      | null: false |
| shipping_charge_id     | integer      | null: false |
| area_id                | integer      | null: false |
| date_id                | integer      | null: false |
| price                  | string       | null: false |
| user                   | references   | ----------- |

### Association

- has_one    :buyers
- belongs_to :users

## buyers テーブル

| Column                   | Type       | Options     |
| ------------------------ | ---------- | ----------- |
| card_information         | string     | null: false |
| date_of_expiry           | string     | null: false |
| code                     | string     | null: false |
| user                     | references | ----------- |
| item                     | references | ----------- |

### Association

- belongs_to :users
- belongs_to :items
- has_one    :address

## address テーブル

| Column              | Type       | Options     |
| ------------------- | ---------- | ----------- |
| postal_code         | string     | null: false |
| area         | -----------| null: false |
| municipalities      | string     | null: false |
| number_address      | string     | null: false |
| building_name       | text       | ----------- |
| phone_number        | string     | null: false |
| buyer_id            | references | ----------- |

### Association

- belongs_to :buyers