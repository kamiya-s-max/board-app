# README
本アプリはユーザーが自分の得意分野(以下expert)をカードにして投稿できるサービスです。サインイン後、
「カードを追加する」でカードに「expertの種類」、「expertの名前」、「expertのキャリア」、
「PR文」、「希望連絡先」を記載し、投稿することで簡単にアピールできます。また、これから自分がはじめたい
分野のカードを閲覧することで簡単にその道のエキスパートと知り合うことができます。

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
|career|integer|null: false|
|text|text||
|contact|string||
|user_id|references|foreign_key: true|
|type_id|references|foreign_key: true|
### Association
- belongs_to :user
- belongs_to :type
## typesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false, unique: true, add_index|
### Association
- has_many :experts

