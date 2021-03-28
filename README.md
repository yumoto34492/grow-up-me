# README
## アプリケーション名
# Grow up me

## 概要
目標達成を目指し自信の成長をサポートするアプリケーションになります。
立てた目標が三日坊主になることを防ぐために、具体的なアクションプランや達成までの期日、目標達成後の成長した自分の姿までイメージして投稿します。
<br>
<br>

## 制作意図
  小さな目標でも容易に達成できるような仕組みを作りたい！と思いアプリケーションを作成しました。
  日頃から大なり小なり目標を立てては続かず、どうすれば目標達成できるか悩んでいました。
試行錯誤を重ねた結果、if then プランニングと言う方法を使って具体的な行動パターンを予め決めておくと、目標達成に向けてのアクションを習慣化できることがわかりました。この経験から、目標を設定する際に具体的なアクションプランを設定することにしました。
  また、目標を公開することでパブリックコミットメントの原理が作用し、投稿した本人は「目標をきちんと達成する人」と見られたいと思うようになります。このような心理作用も働き、今まで以上にあらゆる目標を達成しやすくなると思い作成しました。
<br>
<br>

## 🌐URL
https://grow-up-me.herokuapp.com/users/sign_in
<br>
<br>

## 👤テスト用アカウント
### アカウント名:yumoto

### Eメールアドレス:yumoto@yumoto.com

### パスワード:yumoto34492
<br>
<br>

## 利用方法
### ユーザー管理機能
* ユーザー名、Eメールアドレス、パスワードを入力するとサインインができます。<br>
* Eメールアドレス、パスワードを入力すればログインができます。
![ユーザー管理機能](https://user-images.githubusercontent.com/78357097/112574363-7147ba80-8e31-11eb-961c-fbb190a08af5.gif)

<br>

### 投稿機能
下記項目を入力すると目標を投稿することができます。
* 目標
* ジャンル
* 期日
* アクションプラン
* 目標の人物
* 目標達成後の自分はどうなっている？
* イメージ写真
<br>
<br>

![投稿機能](https://user-images.githubusercontent.com/78357097/112586365-0a310280-8e3f-11eb-9c6d-0039788cd5d6.gif)
<br>
<br>

### 投稿編集機能
詳細画面にて投稿した目標の編集をすることができます。
![投稿編集機能](https://user-images.githubusercontent.com/78357097/112587940-e1f6d300-8e41-11eb-9060-ec4ee05a468a.gif)
<br>
<br>

### 投稿削除機能
詳細画面にて投稿した目標を削除することができます。
![投稿削除機能](https://user-images.githubusercontent.com/78357097/112588334-8d078c80-8e42-11eb-8b69-aab06a6bf6ed.gif)
<br>
<br>

## 目指した課題解決
なにか目標を立てても、継続できなかったり、忘れてしまうことがあります。そんな問題を解決をするため、具体的なアクションプランを書き出し投稿できるようにしました。
また、目標の人物や目標達成後の自分の姿を投稿時に設定することで、漠然としたイメージから具体的なイメージを持てるようにしました。
<br>
<br>

## 洗い出した要件
* 投稿機能
* 詳細機能
* ログイン機能
* コメント機能
* カレンダー表示機能
* フォロー機能
* 投稿検索機能
* 投稿毎に公開非公開を設定可能にする

<br>
<br>

## 使用環境（開発環境）
###  バックエンド
* ruby on Rails
<br>

### フロントエンド
* JavaScript
<br>

### データベース
* MySQL
<br>

### Webサーバー（本番環境）
* heroku
<br>

### ソース管理
* GitHub、GitHubDesktop
<br>

### テスト
* RSpec
<br>

### エディタ
* VSCode
<br>
<br>

## 実装した機能
* ログイン機能
* 投稿機能
* 編集・削除機能
<br>
<br>

## 実施予定の機能
* コメント機能
* 投稿毎に公開非公開を設定可能にする
* カレンダー機能
* 投稿検索機能
* フォロー機能

<br>
<br>

<br>
<br>

## データベース設計
## ER図
![GrowUpMe](https://user-images.githubusercontent.com/78357097/112414286-295b6180-8d65-11eb-9fb2-39767e6f0cf8.png)
<br>
<br>

## user テーブル

| Column             | Type    | Options                |
| ----------------   | ------  | ---------------------  |
| name               | string  | NOT NULL               |
| email              | string  | NOT NULL, unique: true | 
| encrypted_password | string  | NOT NULL               | 

### Association
- has_many :targets



## target テーブル

| Column       | Type       | Options            |
| -----------  | ---------- | -----------------  |
| title        | string     | NOT NULL           |
| genre_id     | string     |                    |
| deadline     | date       | NOT NULL           |
| plan         | text       | NOT NULL           |
| great_man    | string     | NOT NULL           |
| future       | text       | NOT NULL           |
| user         | references | foreign_key: true  |

### Association
- belongs_to :user
<br>
<br>

## ローカルでの動作方法
* Railsバージョン：6.0.3.5
* Yarnバージョン:1.22.10
* git clone https://github.com/yumoto34492/grow-up-me.git
* % bundle install
* % yarn install
* % rails db:create
* % rails db:migrate
* % rails s
