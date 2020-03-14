# README

## アプリケーション名
#### wryblog(ブログアプリ)

## アプリケーション概要

#### 本番環境
- http://54.248.15.174/
#### ID/Pass
- ID: admin
- Pass: 2222
#### テスト用アカウント1
- メールアドレス: aaa@aaa
- パスワード: aaaaaa     
#### テスト用アカウント2
- メールアドレス: bbb@bbb
- パスワード: bbbbbb

#### どうして作ったか
- 個人でブログを書いていて、記事を探すときになかなか見たい記事が見つけられず不便なので自分で作て見たらどうだろう？と思い作成しました。

#### 工夫した点
- 見たい記事を探しやすくしました。
- 記事のタイトル検索
- タグ付け
- 著者ごとの記事一覧

- 表示画面に動きをつけました。
- 楽しく見れるようslickやhover等を使い工夫いたしました。

- コメント機能が非同期になっています。

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
- タグ機能
- 画像複数枚登録

## アプリケーション内で使用している技術一覧

|種別|名称|
|------|----|
|開発言語|Ruby(ver 2.5.1)|
|フレームワーク|Ruby on Rails(ver 5.0.7.2)|
|マークアップ|HTML(Haml),CSS(Sass)|
|フロントエンド|JavaScript(jQuery)|
|DB|MySQL|
|画像アップロード|carrierwave, AWS S3|
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
- has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true
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

#### Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|image_url|string|null: false|
|blog|references|foreign_key: true|

#### Association
- belongs_to :blog, optional: true


