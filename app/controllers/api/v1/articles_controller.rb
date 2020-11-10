module Api::V1
  class ArticlesController < BaseApiController
    def index
      # binding.pry
      # 記事全てを表示する
      # ActiveRecordを使ってインスタンス変数を設定
      # selectメソッドで”title”を指定.orderで昇順設定(〇〇 DESC)で降順に設定できる
      @articles = Article.order("updated_at")
      # 記事の例を作らないとhashが空だった
      # ActiveRecordでUserモデル、Articleモデル共に作成した
      # Usersテーブルに対し、articleテーブルの関係はBelongs_toなので、
      # まずはUserテーブルの入力から進めなければならなかった(user_idが必要になるとか)。
      # # ////////////#
      # binding.pry
      # # ArtilePreviewsSerializer の表示方法はserializerを採用
      # renderって何？とりあえず今回は出力のパターンという理解で進める
      # 例えば＠articles(インスタンス変数)はjson形式で出力,
      # またArticlePreviewSerializerの内容は
      # each_serializer(serializerで出力したいデータが複数の場合はeach_serializer)で出力
      render json: @articles, each_serializer: Api::V1::ArticlePreviewSerializer
      # 記事が新しい順に並び替えないといけない
      # binding.pry
    end
  end
end
