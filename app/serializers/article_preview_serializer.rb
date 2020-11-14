class ArticlePreviewSerializer < ActiveModel::Serializer
  # articlの一覧表示の処理だけは他の処理と分けたいので、別途ArticlePreviewSerializerを作成した！
  attributes :id, :title, :updated_at
  belongs_to :user, serializer: UserSerializer

  # has_many :comments, :article_likes
  # →articleLikesSerializerを入力していない段階で、
  # articlesControllerのIndexのテストをすると以下のエラーコードが出た。
  # uninitialized constant Api::V1::ArticlePreviewSerializer Did you mean? ArticleLikesSerializer
  # なので一旦”has_many :comments, :article_likes”はコメントアウトしておく。
end
