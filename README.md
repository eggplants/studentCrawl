# studentCrawl
- 筑波大学生の公開ホームページをクロールしちゃお!
- (一応indexページのみ公開)

# 中身
- `execute.sh`
  - `existcheck.rb`を動かしたり
  - 生成したファイルをまとめたり
- `existcheck.rb`
  - [parallel](https://github.com/grosser/parallel)でクロール
- `IDS`
  - 存在している学籍番号
- `LISTS`
  - indexページのURI一覧
- `LISTS_MD`
  - リンクをクリックで踏めるようにしたもの
- `log`
  - `execute.sh`の実行ログ
