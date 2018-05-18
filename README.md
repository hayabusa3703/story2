# テーブル設計


## userテーブル

|Column|Type|Options|
|------|----|-------|
|name|string||null: false, unique: true|
|image|string||
|registration_date|datetime|
|facbook_id|integer|

### Association

- has_many :storys,
- has_many :followers
- has_many :comments

## commentテーブル

|Column|Type|Options|
|------|----|-------|
|comment|string|null: false, unique: true|
|story|references|null: false, foreign_key: true||
|user|references|null: false, foreign_key: true||

### Association
- belongs_to :user
- belongs_to :story


## storyテーブル

|Column|Type|Options|
|------|----|-------|
|textarea|text||
|like-point|integer|
|user|references|null: false, foreign_key: true||
|category|reference|null: false, foreign_key: true||
|created_at|datetime|
aaaaaaaa
