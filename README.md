# サービス概要
思い出の場所の共有サイト
「Spotストッカー」

http://spot-stocker.com

「次の休みの出かける場所を探してる時間がない」「情報量が多すぎてどこを選んだらいいのか分からない」

こんな悩みを解決したい方の手助けになると思い作成しました。

# サービスURL
現在はEC2上とheroku上にデプロイしております。（レスポンシブは、現在未対応です）

EC2: http://spot-stocker.com


heroku: https://spot-stocker.herokuapp.com

# 技術スタック
* Ruby 2.5.1
* Rails 6.0.1
  * Slim　（HTMLテンプレートエンジン使用）
* MySQL
* CircleCI
* EC2
  * （AWS：S3・VPC・RDS・Route５３）
* heroku
  * （AWS:S3)


# 機能一覧
* サインアップ・サインイン (devise)
  * マイページの表示・編集・ユーザー情報の編集・削除
* 記事投稿・編集・削除
  * 郵便番号入力で自動住所表示 （Ajax）
  * 投稿時の住所の緯度・経度を取得してGoogleMapに表示 (GoogleMapsApi)
  * 記事サムネイル画像ファイルのアップロード （AWS S３）
  * 投稿記事本文にドラック＆ドロップで画像添付や、太字・斜体に切り替え （Rails6.0 ActionText）
  * 評価を１０段階にて登録・表示 (Ajax)
  * コメント・いいね・ストック機能 (Ajax)
* 投稿記事の検索 (ransack）
* 投稿記事のソート機能 (ransack）
* 投稿記事のページネーション （kaminari）
* 投稿記事の都道府県別の表示

●プレビュー>>スポット一覧画面
![FireShot Capture 010 - Spotストッカー - spot-stocker herokuapp com](https://user-images.githubusercontent.com/57358551/72244809-6345b980-3632-11ea-846e-824b73fa8109.png)
●プレビュー>>記事投稿画面
![FireShot Capture 011 - Spotストッカー - spot-stocker herokuapp com](https://user-images.githubusercontent.com/57358551/72244814-6771d700-3632-11ea-9068-d128b6460199.png)


# テーブル設計
下記のテーブルにて作成しております。（2020/01/13）


■ユーザー：user


■投稿：spot


■コメント：comment


■いいね：like


■ストック：stock

<img width="943" alt="【ER図】Postストッカー_New_Diagram_-_Cacoo" src="https://user-images.githubusercontent.com/57358551/72245754-98eba200-3634-11ea-95ea-004586721271.png">



# 環境構築方法/セットアップの仕方
　・1112hiroki/spot_stockerのリポジトリをあなたのリポジトリに[fork](https://qiita.com/YumaInaura/items/acff806290c8953d3185)して下さい。

　・各種Gemのインストール
```
bundle install
```

　・データ準備
```
yarn install --check-files # yarnのインストール + node_modulesにあるファイルが削除されていないことを確認
rails db:create # DB作成
rails db:migrate # テーブル作成
```

　・画面確認

```
rails s
```

[http://localhost:3000](http://localhost:3000) にアクセスしてログイン画面が表示されればOK。
