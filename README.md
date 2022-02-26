# README

#テーブル設計

## users（ユーザー情報）テーブル

| Column              | Type    | Options                      |
|---------------------|---------|------------------------------|
| nickname            | string  | null:false                   |
| email               | string  | null:false, uniqueness: true |
| encrypted_password  | string  | null:false                   |


### Association

- has_many :items
- has_many :wants
- has_many :supermarkets



## items (冷蔵庫にある商品の情報)テーブル

| Column                 | Type       | Options                      |
|------------------------|------------|----------------------------- |
| thing                  | string     | null:false                   |
| explanation            | text       |                    |
| category_id            | integer    | null:false                   |
| expiry                 | date       | null:false                   |
| user                   | references | null:false,foreign_key: true |

### Association


- belongs_to :user


## wants (欲しい物リスト)テーブル

| Column                 | Type       | Options                      |
|------------------------|------------|----------------------------- |
| wanted                 | string     | null:false                   |
| account(説明)           | text       |                              |
| categori_id            | integer    | null:false                   |  
| user                   | references | null:false,foreign_key: true |
| supermarket            | references | null:false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :supermarket




## supermarkets(お気に入りのスーパーを登録する) テーブル

| Column              | Type       | Options                      |
|---------------------|------------|----------------------------- |
| market              | string     | null:false                   |
| market_url          | string     |                              |
| detail              | text       |                              |
| user                | references | null:false,foreign_key: true |


### Association

- belongs_to :user
- has_many   :wants


