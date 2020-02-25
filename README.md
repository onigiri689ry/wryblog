# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

## blogsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|integer|

## Association
  has_many :tagmaps, dependent: :destroy
  has_many :tags, through: :tagmaps
  belongs_to :user
  has_many :comments


## tagsテーブル
|Column|Type|Options|
|------|----|-------|
|tag_name|string|null: false|

### Association
  has_many :tagmaps, dependent: :destroy
  has_many :blogs, through: :tagmaps


## Tagmapsテーブル
|Column|Type|Options|
|------|----|-------|
|blog_id|integer|
|tag_id|integer|

### Association
  belongs_to :blog
  belongs_to :tag


## Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|

### Association
  has_many :blogs
  has_many :comments 
  

### Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|blog_id|integer|
|text|text|null: false|

### Association
  belongs_to :blog
  belongs_to :user 

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
