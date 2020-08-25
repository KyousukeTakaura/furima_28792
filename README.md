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
has_many :item_purchases, dependent: :destroy

## Items テーブル

| Column       |Type   | Options     |
| ------       | ------ | ----------- |
|name | string | null: false |
|product_description| text | null:false |
|product_category | integer |null:false|
|product_status | integer |null:false|
|delivery_fee   | integer |null:false|
|shipping_area  | integer |null:false|
|shipping_days  | integer |null:false|
|price          | integer |null:false|
|product_image  |references|null:false|
| user  |references|null:false, foreign_key:true|
Association
belongs_to :user
has_many :comments
has_one :item_purchase
## comments テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
|comment | text | null: false |
| user| references | null: false, foreign_key: true|
|item| references | null:false, foreign_key: true |
Association
belongs_to :user
belongs_to:item



## Shipping_address テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| postal_code | string | null: false |
| prefectures | integer | null:false |
| city | string | null: false |
| house_number | string | null: false |
| building_name | string |
| phone_number | string | null: false |
| user | references | null: false, foreign_key:true |
| item | references | null: false, foreign_key:true |
Association
belongs_to:item_purchase


## item_purchases テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user| references | null: false, foreign_key: true|
|item| references | null:false, foreign_key: true |
Association
belongs_to :user
has_one:Shipping_address
belongs_to:item
