require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /index" do
    # binding.pry
    subject { get(api_v1_articles_path) }

    before { FactoryBot.build_list(:article, 5) }

    it "Articleモデルのindexメソッドに接続できる" do
      subject
      # get "/api/v1/articles/index"だと以下のエラー文が出てきちゃう
      # よくよく見るとshowメソッドになっちゃってた
      # AbstractController::ActionNotFound:
      # The action 'show' could not be found for Api::V1::ArticlesController
      expect(response).to have_http_status(:success)
    end

    context "記事が存在する" do
      it "記事の一覧が表示できる" do
        article = FactoryBot.build(:article)

        expect(article).to be_valid
        # binding.pry
      end
    end

    context "記事が存在しない" do
      it "記事の一覧が表示できない" do
        article = FactoryBot.build(:article, title: nil)
        expect(article).to be_invalid
        # binding.pry
      end
    end

    # let!(:article) do
    #   FactoryBot.build_list(:article, 5)
    #   binding.pry
    # end
    # before {FactoryBot.build_list(:article, 5)}
    # binding.pry

    ################ it "記事が更新順に並んでいるテストにするはずなのだがとりあえず置いておく" do  ##############################
    #   subject
    #   # expect(article).to eq{Article.order("updated_at")}
    #   # it "記事が更新順に並んでいる" do
    #   #   article = build_list(:article, 10)
    #   #   # article = FactoryBot.build(:article)
    #   #   #article1~3を作り、それをupdated_at順に並べ変えたい
    #   #   #並べ変えた結果が更新順でtrueになれば良いな →それをecpectで表したい
    #   #   expect(article.order).to eq article.order

    #   res = JSON.parse(response.body)
    #   # expect(res).to be_valid
    #   expect(res[0].keys).to eq ["id", "title", "updated_at", "user"]
    #   # binding.pry
    # end
  end
end
