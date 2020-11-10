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
require "rails_helper"

# RSpec.describe Article, type: :model do
#   pending "add some examples to (or delete) #{__FILE__}"
# end
RSpec.describe "Api::V1::Articles", type: :model do
  describe "GET /api/v1/articles" do
    context "タイトルが記載されている場合" do
      # binding.pry
      it "記事一覧に表示される" do
        article = Article.new(title: "きんちゃん、きんきん", body: "キンキンに冷えたきんちゃんはキンキンだ！！")
        expect(article).to be_valid
        # expect("GET/articles").to be_valid
      end
    end

    context "タイトルが記載されていない場合" do
      it "記事一覧に表示されない" do
        article = Article.new(body: "キンキンに冷えたきんちゃんはキンキンだ！！")
        expect(article).to be_invalid
      end
    end

    context "タイトルが重複している場合" do
      it "記事一覧に表示される" do
      end
    end
  end
end

# RSpec.describe "Api::V1::Articles", type: :request do
#   describe "GET /articles" do
#     #indexメソッドのテストをしたいということ
#     #なぜThe action 'show' could not be found for Api::V1::ArticlesController
#     #と出てしまうのか？どこでshowメソッドを入れ込んだ？

#     subject { get(api_v1_articles_path) }

#     let!(:article1) { create(:article, updated_at: 1.days.ago) }
#     let!(:article2) { create(:article, updated_at: 2.days.ago) }
#     let!(:article3) { create(:article) }

#     it "記事の一覧が取得できる" do
#       subject
#       res = JSON.parse(response.body)

#       expect(response).to have_http_status(:ok)
#       expect(res.length).to eq 3
#       expect(res.map {|d| d["id"] }).to eq [article3.id, article1.id, article2.id]
#       expect(res[0].keys).to eq ["id", "title", "updated_at", "user"]
#       expect(res[0]["user"].keys).to eq ["id", "name", "email"]
#     end
#   end
# end
