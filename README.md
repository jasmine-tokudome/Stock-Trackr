# Stock Trackr

本アプリは、カラーミーショップを運営するショップオーナー様にお役立ていただける「在庫管理」アプリです。


# DEMO

"hoge"の魅力が直感的に伝えわるデモ動画や図解を載せる

# Features

「注文キャンセルが発生した。
（在庫戻りが発生するため、実際の在庫数と相違がないか確認する必要がある）」
「仕入れが必要な商品はあるか、それはどの商品か。」
そういった、日々のネットショップ運営で欠かせない在庫管理の負担を軽減したく、制作しました。

カラーミーショップ管理画面は高い機能性を備えています。
一方、本アプリは機能性は低いです。
その分、業務の利便性を重視し、カラーミーショップ管理画面に備わっていない部分を補完する機能を、カラーミーAPIを利用して実装しました。

購入機会の損失や購入トラブルを避けるために営業日には必須の作業となるため、より少ない操作で在庫管理状態や在庫数の把握ができる構成にしました。

全商品の在庫状況を一覧で表示させているため画面遷移がなく、操作が少ないです。
商品情報の修正が必要となった場合は該当商品の編集画面（カラーミーショップ管理画面）に1クリックでアクセスできます。

また、仕入れが必要な商品がすぐに把握できるよう、カラーミーショップ管理画面で設定した適正在庫数を切った商品にはアイコンが表示されるようにしました。

今後は、オプションごとの在庫数の変更や項目の追加（掲載状態とカテゴリー）、在庫数更新完了を知らせる通知機能などを追加したいなと考えています。

# Requirement

"hoge"を動かすのに必要なライブラリなどを列挙する

* huga 3.5.2
* hogehuga 1.0.2

# Installation

Requirementで列挙したライブラリなどのインストール方法を説明する

```bash
pip install huga_package
```

# Usage

DEMOの実行方法など、"hoge"の基本的な使い方を説明する

```bash
git clone https://github.com/hoge/~
cd examples
python demo.py
```

# Note

注意点などがあれば書く

# Author

作成情報を列挙する

* 作成者
* 所属
* E-mail

# License
ライセンスを明示する

"hoge" is under [MIT license](https://en.wikipedia.org/wiki/MIT_License).

社内向けなら社外秘であることを明示してる

"hoge" is Confidential.

## ライセンス

[Ruby on Rails チュートリアル](https://railstutorial.jp/)内にある
ソースコードはMITライセンスとBeerwareライセンスのもとで公開されています。
詳細は [LICENSE.md](LICENSE.md) をご覧ください。

## 使い方

このアプリケーションを動かす場合は、まずはリポジトリを手元にクローンしてください。
その後、次のコマンドで必要になる RubyGems をインストールします。

```
$ gem install bundler -v 2.3.14
$ bundle _2.3.14_ config set --local without 'production'
$ bundle _2.3.14_ install
```

その後、データベースへのマイグレーションを実行します。

```
$ rails db:migrate
```

最後に、テストを実行してうまく動いているかどうか確認してください。

```
$ rails test
```

テストが無事にパスしたら、Railsサーバーを立ち上げる準備が整っているはずです。

```
$ rails server
```

詳しくは、[*Ruby on Rails チュートリアル*](https://railstutorial.jp/)
を参考にしてください。