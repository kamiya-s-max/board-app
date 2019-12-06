# README
## 概要
本アプリはユーザーが自分の得意分野をカード(expertカード)にして投稿しアピールできるサービスです。また、これから自分がはじめたい分野のカードを閲覧することで簡単にその道のエキスパートと知り合うことができます。
## 機能一覧
- ユーザー登録機能
- ログイン、ログアウト機能
- ユーザーニックネーム、メールアドレス編集機能
- expertカード一覧機能
- expertカード投稿機能
- expertカード詳細確認機能
- expertカード編集・削除機能
## 使用技術
- デプロイ: heroku
- DB: PostgreSQL
- 言語: Ruby
- フレームワーク: Ruby on Rails
- マークアップ: haml,scss
- ユーザー管理(新規登録、ログイン、ログアウト): devise
# DB設計
## usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false, unique: true, add_index|
|email|string|null: false, unique: true|
|password|string|null: false|
### Association
- has_many :experts
## expertsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
|career|string|null: false|
|text|text||
|contact|string||
|user_id|references|foreign_key: true|
|category_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :category
## categoriesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, add_index|
### Association
- has_many :experts

