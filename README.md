# 概要
デートで失敗したくない人のためのデートスポット共有サイト「Spotストッカー」。

「デートの予定を立てる時間がない」「情報量が多すぎてどこを選んだらいいのか分からない」こんな悩みを解決したい方、どうぞ。


# URL
まだインターネット公開はされていません。

# 環境
* Ruby 2.5.1
* Rails 6.0.1
* sqlite

# セットアップ
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
