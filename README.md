# README

## Users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| nickname | string | null: false |
| email    | string | null: false |
| password | string | null: false |
|first_name| string | null:false  |
|last_name | string | null:false  |
|first_name kana| string | null:false |
|family_name kana| string | null:false |
|birth_day | date | null:false|
Association
has_many :items, dependent: :destroy
has_many :comments, dependent: :destroy
has_one :credit_card, dependent: :destroy
has_one :Shipping_address, dependent: :destroy

## Items テーブル

| Column       |Type   | Options     |
| ------       | ------ | ----------- |
|product_name | string | null: false |
|product_description| string | null:false |
|product_category | references |null:false|
|product_status | references |null:false|
|delivery_fee   | references |null:false|
|shipping_area  | references |null:false|
|shipping_days  | references |null:false|
|price          | integer |null:false|
|product_image  |references|null:false|
| user_id       |references|null:false, foreign_key:true|
Association
belongs_to :user
has_many :comments

## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|comment | text | null: false |
| user_id | references | null: false, foreign_key: true|
|items_id | references | null:false, foreign_key: true |
Association
belongs_to :user
belongs_to:items

## credit_card テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| card_id | integer    |                                |
| expiration_date  | integer| null: false |
| security_cord    | integer | null: false |
| user_id | references | null:false, foreign_key:true|
Association
belongs_to:user


## Shipping_address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code | integer | null: false
| prefectures | references | null: false
| city | string | null: false |
| house_number | string | null: false |
| building_name | string | null: false |
| phone_number | integer | null: false |
| user_id | references | null: false, foreign_key:true |
Association
belongs_to:user