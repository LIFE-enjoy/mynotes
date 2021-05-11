# アプリケーション名
**『My Notes』**
# アプリケーション概要
このアプリケーションは学習用のメモアプリケーションです。

# URL
https://mynotes-app35013.herokuapp.com/

# テスト用アカウント
アプリケーション内でゲストユーザーを選択してください。

# 利用方法
まずユーザー登録をする必要があります。

## 新規メモ作成機能
検索フォームの下にあるペンのアイコンをクリックすると新規メモが作成できます。メモは自動保存されますので記入したら保存されます。

## メモ一覧
作成したメモは本の左側に一覧表示され、更新順に並んでいます。

## メモ検索機能
本の左側にある検索フォームにメモのタイトルを入力するとヒットしたメモだけメモ一覧に残ります。

## メモ編集機能
メモ一覧からタイトルをクリックすると作成したメモの編集ページに遷移します。新規メモ作成と同様にメモは自動保存されます。

## 画像添付機能
画像をドラッグ&ドロップまたは画像添付ボタンをクリックするとメモに画像を載せることができます。

## ログアウト機能
新規メモ作成及びメモ編集画面にて、右側下部のツールバーの走っている人のアイコンをクリックするとログアウトすることができます。誤ってクリックしてしまった時のために、アラートが表示されるようになっています。

## ユーザ編集機能
ユーザの詳細ページ右上のペンのアイコンをクリックするとユーザ情報を編集できます。編集できるのは、nickname,Email,プロフィール,アバター画像です。

## チャット添削機能
新規メモ作成及びメモ編集画面にて、右側下部のツールバーの右から2番目のアイコンをクリックすると、チャットページに遷移します。そのページのURLを知っており、ログインしているユーザは誰でもチャットに参加することができます。右側には作成したメモが表示され、そのメモを見ながらチャット形式で添削を行うことができます。チャットは保存されており、メモを削除するとチャットも削除されます。チャットページにて右側下部のツールバーの右端のアイコンをクリックすると退出できます。

## メモ削除機能
右側下部のツールバーのゴミ箱のアイコンをクリックするとメモを削除することができます。誤ってクリックしてしまった時のために、アラートが表示されるようになっています。

## コメント削除機能
コメントの横のゴミ箱のアイコンをクリックするとコメントを削除することができます。誤ってクリックしてしまった時のために、アラートが表示されるようになっています。

## 通知機能
自分以外のコメントが投稿された場合、ツールバーのアイコンに通知が表示されるようになっています。

# 目指した課題解決
このアプリケーションは学習中にノートをとっている時に「どこに書いているかわからなくなった」「自分で書いたノートの内容が本当に合っているのか」という問題意識から生まれました。学習ノートをとっていくうちにどこに書いてあるかわからなくなり、探す時間を無駄にしてしまったり、同じことを何度も書いてしまうことがあるかと思います。また、自己流でノートをとっていくことで、間違った認識をしてしまい、非効率な学習になってしまったこともあるかと思います。効率よく、手軽に学習を進めていけるように、このアプリケーションを使って楽しくスキルアップができるようになればと思い、作成しました。




# 洗い出した要件

|優先順位 3~1|機能        |目的         |詳細        |ストーリー |見積もり|
|--------------------------|----------- |------------|-----------|----------|------|
|3|メモ機能|学習内容をメモできるようにするため|・メモ一覧表示<br>・新規メモ作成機能 <br> ・メモ編集機能<br>  ・メモ削除機能<br> |・新しいメモを作成できる<br>・メモの一覧が表示される<br>・メモを編集できる<br>・メモを削除できる<br>・シンプルなノートのようなの表示<br> |10h|
|3|検索機能|メモを検索できるようし、学習時間の効率を上げるため|検索フォームを用意し、メモのタイトルを入力すれば一覧が表示される|・メモを検索できる<br>・非同期で検索でき、ストレスなく検索できる<br> |10h|
|3|ユーザ登録機能|ユーザごとにメモを管理し、信頼性を高めるため|・ユーザ詳細ページ<br>・ユーザ新規登録機能<br>・ユーザ詳細ページ編集機能<br>・ログイン・ログアウト機能<br> |・ニックネームとEmailとパスワードだけで登録できる<br>・登録が簡単にできる<br>・ユーザの詳細ページからユーザ情報を編集できる<br> |10h|
|3|チャット機能|自分で書いたメモを共有でき、チャット形式で添削をしてもらえるようにするため|・チャット機能<br>・チャットページのURLを知っていれば複数人でもチャットができる<br> ・コメント削除機能|メモはしたがあっているかどうか不安な時に添削して欲しい人にURLを送信することで、会話しているように添削ができる|15h|
|2|画像添付機能|メモに画像を付けられるようにするため|・Action_textを使った画像添付機能<br>・複数枚の画像を添付できる<br> |メモの内容記入欄に画像をドラッグ&ドロップまたは画像添付ボタンをクリックすることでメモに画像を添付できる|5h|
|2|通知機能|コメントされた時に通知が届くようにするため|・コメント通知機能<br>・通知一覧機能<br> |他の人が自分のメモにコメントした場合、通知が届き、|10h|



# 実装した機能について
## 新規登録
[![Image from Gyazo](https://i.gyazo.com/0a42a17c6838aaf3cd58eedcd2d88782.gif)](https://gyazo.com/0a42a17c6838aaf3cd58eedcd2d88782)

Nickname、Email、passwordと入力すると新規登録が完了します。

## ログイン
[![Image from Gyazo](https://i.gyazo.com/f34178bbc728a8858ad73dd005ff0a6b.gif)](https://gyazo.com/f34178bbc728a8858ad73dd005ff0a6b)

登録したユーザのEmailとPasswordを入力するとログインできます。

## ユーザ情報編集

[![Image from Gyazo](https://i.gyazo.com/7777d181dbe6fcf3beba7731ca1cd03d.gif)](https://gyazo.com/7777d181dbe6fcf3beba7731ca1cd03d)

こちらのようにユーザ詳細ページからペンのアイコンをクリックしてユーザ情報編集ページに遷移するとNicknameとEmail、プロフォール、アバター画像が編集できます。

## 新規メモ作成
[![Image from Gyazo](https://i.gyazo.com/69b603865245c91a324677ea3c37efa9.gif)](https://gyazo.com/69b603865245c91a324677ea3c37efa9)

こちらの新規メモ作成のアイコンをクリックすると新規メモが作成できます。

## メモ一覧
[![Image from Gyazo](https://i.gyazo.com/0c91ef7fee5d6c09f3344df31209f8ff.gif)](https://gyazo.com/0c91ef7fee5d6c09f3344df31209f8ff)

作成したメモは左側に一覧表示されます。

## メモ検索
[![Image from Gyazo](https://i.gyazo.com/761face314261bf63ed93ec6f6f5c5ac.gif)](https://gyazo.com/761face314261bf63ed93ec6f6f5c5ac)

左側上部の検索バーを使えば、動画のように動的にメモを検索できます。

## メモ編集
[![Image from Gyazo](https://i.gyazo.com/aae4c73a4fc14a903e3046f15f153a11.gif)](https://gyazo.com/aae4c73a4fc14a903e3046f15f153a11)

メモを編集し保存する際はこのように自動保存・更新されます。

## メモ削除
[![Image from Gyazo](https://i.gyazo.com/b23935782979ac58e7a23c8b3cd3366d.gif)](https://gyazo.com/b23935782979ac58e7a23c8b3cd3366d)

このように右下のゴミ箱のアイコンをクリックするとメモを削除できます。

## 画像添付
[![Image from Gyazo](https://i.gyazo.com/548e439f6a26898770f490f050d7b599.gif)](https://gyazo.com/548e439f6a26898770f490f050d7b599)

このように画像も添付することができます。

## 非同期チャット
[![Image from Gyazo](https://i.gyazo.com/058a008ad3d0282506834cd376c444e9.gif)](https://gyazo.com/058a008ad3d0282506834cd376c444e9)

コメントページでは、そのメモに対して非同期でチャットをすることができます。

## 通知
[![Image from Gyazo](https://i.gyazo.com/d0f0e82b6233fb7a844e9c10d2aa9bdb.gif)](https://gyazo.com/d0f0e82b6233fb7a844e9c10d2aa9bdb)

メモ作成者がコメントのページを開いていない時にコメントされると、通知が届き、通知一覧を見ることができます。

# テーブル設計
## ER図
![](mynotes.png)

## usersテーブル

| column             | type   | option   |
|------------------- |------- |--------- |
| nickname           | string | NOT NULL |
| email              | string | NOT NULL |
| encrypted_password | string | NOT NULL |
| profile            | text   |          |

imageはActive Storageを使用

### Association

- has_many :notes
- has_many :comments
- has_many :active_notifications, class_name: "Notification", foreign_key: "visiter_id", dependent: :destroy
- has_many :passive_notifications, class_name: "Notification", foreign_key: "visited_id", dependent: :destroy


## notesテーブル

| column           | type       | option                            |
|----------------- |------------|-----------------------------------|
| title            | string     | NOT NULL                          |
| user_id          | references | foreign_key :true, NOT NULL       |

content(本文)はAction Textを使用。
imageはActive Storageを使用

### Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :notifications, dependent: :destroy

## commentsテーブル

| column     | type       | option                       |
|------------|------------|----------------------------- |
| text       | text       | NOT NULL                     |
| user_id    | references | foreign_key :true, NOT NULL  |
| note_id    | references | foreign_key :true, NOT NULL  |

### Association

- belongs_to :note
- belongs_to :user
- has_many :notifications, dependent: :destroy

## notificationsテーブル

| column     | type       | option                        |
|------------|------------|------------------------------ |
| visiter_id | integer    | NOT NULL                      |
| visited_id | integer    | NOT NULL                      |
| note_id    | integer    | NOT NULL                      |
| comment_id | references | foreign_key :true, NOT NULL   |
| action     | string     | default :'', NOT NULL         |
| checked    | boolean    | foreign_key :true, NOT NULL   |

### Association

- belongs_to :note, optional: true
- belongs_to :comment, optional: true
- belongs_to :visiter, class_name: 'User', foreign_key: 'visiter_id', optional: true
- belongs_to :visited, class_name: 'User', foreign_key: 'visited_id', optional: true