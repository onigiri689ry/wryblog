# README

## アプリケーション概要

- ブログアプリ

## アプリケーションの機能一覧

- Basic認証機能
- ユーザー新規登録機能
- ユーザーログイン／ログアウト機能
- ブログ投稿機能
- ブログ編集/削除機能
- コメント機能（非同期化）
- ページネーションの実装
- ブログの新しい記事が上に表示される機能
- タイトル検索機能

## アプリケーション内で使用している技術一覧

|種別|名称|
|------|----|
|開発言語|Ruby(ver 2.5.1)|
|フレームワーク|Ruby on Rails(ver 5.0.7.2)|
|マークアップ|HTML(Haml),CSS(Sass)|
|フロントエンド|JavaScript(jQuery)|
|DB|MySQL|
|本番環境|AWS EC2|
|自動デプロイ|capistrano|
|ユーザー管理|devise|

## データベース

### blogsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|text|text|null: false|
|user_id|integer|

#### Association
- has_many :tagmaps, dependent: :destroy
- has_many :tags, through: :tagmaps
- belongs_to :user
- has_many :comments


### tagsテーブル
|Column|Type|Options|
|------|----|-------|
|tag_name|string|null: false|

#### Association
- has_many :tagmaps, dependent: :destroy
- has_many :blogs, through: :tagmaps


### Tagmapsテーブル
|Column|Type|Options|
|------|----|-------|
|blog_id|integer|
|tag_id|integer|

#### Association
- belongs_to :blog
- belongs_to :tag


### Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false|
|password|string|null: false|

#### Association
- has_many :blogs
- has_many :comments 
  

#### Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|
|blog_id|integer|
|text|text|null: false|

#### Association
- belongs_to :blog
- belongs_to :user 

