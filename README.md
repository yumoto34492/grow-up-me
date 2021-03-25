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
### ログイン機能
ユーザー名、Eメールアドレス、パスワードを入力するとログインができます。

<br>

### 投稿機能
必要事項を入力すると設定した目標を投稿することができます。

<br>

### 編集・削除機能
詳細画面にて投稿した目標の編集と削除ができます。
<br>

## 目指した課題解決
なにか目標を立てても、継続できなかったり、忘れてしまうことがあります。そんな問題を解決したかったので、具体的なアクションプランを書き出し投稿できるようにしました。

<br>

## 洗い出した要件

<br>
<br>

## 実装した機能の説明

<br>
<br>

## 使用環境（開発環境）
###  バックエンド
* ruby on Rails
<br>
<br>

### フロントエンド
* JavaScript
<br>
<br>

### データベース
* MySQL
<br>
<br>

### インフラ

<br>
<br>

### Webサーバー（本番環境）
* heroku
<br>
<br>

### アプリケーションサーバー（本番環境）
<br>
<br>

### ソース管理
* GitHub、GitHubDesktop
<br>
<br>

### テスト
* RSpec
<br>
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