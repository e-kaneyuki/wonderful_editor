class ArticlePreviewSerializer < ActiveModel::Serializer
  # articlの一覧表示の処理だけは他の処理と分けたいので、別途ArticlePreviewSerializerを作成した！
  attributes :id, :tittle, :updated_at
  belongs_to :user, serializer: Api::V1::UserSerializer

  has_many :comments, :article_likes
end
