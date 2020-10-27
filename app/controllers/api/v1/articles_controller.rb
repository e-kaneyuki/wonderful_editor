module Api::V1
  class ArticlesController < BaseApiController
    def index
      # binding.pry
      #記事全てを表示する
      @articles = Article.all
      #記事の例を作らないとhashが空だった
      #////////////#

      #ArtilePreviewsSerializer の表示方法はserializerを採用
      #renderって何？とりあえず今回は出力のパターンという理解で進める
      #例えば＠articles(インスタンス変数)はjson形式で出力,
      #またArticlePreviewSerializerの内容は
      #each_serializer(serializerで出力したいデータが複数の場合はeach_serializer)で出力
      render json: @articles, each_serializer: ArticlePreviewSerializer
      #記事が新しい順に並び替えないといけない

      #
    end
  end
end
