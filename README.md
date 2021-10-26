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
- has_many :classifications


## items (冷蔵庫にある商品の情報)テーブル

| Column                 | Type       | Options                      |
|------------------------|------------|----------------------------- |
| thing                  | string     | null:false                   |
| explanation            | text       |                    |
| category_id            | integer    | null:false                   |
| expiry                 | date       | null:false                   |
| user                   | references | null:false,foreign_key: true |

### Association

- belongs_to :classification
- belongs_to :user


## wants (欲しい物リスト)テーブル

| Column                 | Type       | Options                      |
|------------------------|------------|----------------------------- |
| wanted                 | string     | null:false                   |
| account(説明)           | text       |                              |
| super                  | string     | null:false,foreign_key: true |
| super_url              | string     |                              |
| categori               | integer    | null:false,foreign_key: true |  
| user                   | references | null:false,foreign_key: true |
| supermarket            | references | null:false,foreign_key: true |

### Association

- belongs_to :user
- belongs_to :supermarket


## classifications (カテゴリ毎の情報)

| Column                 | Type       | Options                      |
|------------------------|------------|----------------------------- |
| item                   | references | null:false,foreign_key: true |


### Association

- has_many   :items
- belongs_to :user



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


<!-- ## rooms テーブル

| Column | Type   | Options     |
| ------ | ------ | ----------- |
| name   | string | null: false |

### Association

- has_many :room_users
- has_many :users, through: :room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| content | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user -->
