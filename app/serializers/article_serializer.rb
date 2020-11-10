# == Schema Information
#
# Table name: articles
#
#  id         :bigint           not null, primary key
#  body       :text
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint           not null
#
# Indexes
#
#  index_articles_on_user_id  (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (user_id => users.id)
#
class Api::V1::ArticleSerializer < ActiveModel::Serializer
  # articleのindex以外のAPI処理をいれる場所 ※serializerは簡便にJson形式で表示する為のディレクトリということは覚えておく
  attributes :id, :title, :updated_at
  belongs_to :user, serializer: Api::V1::UserSerializer
  # has_many :comments, :article_likes
end
