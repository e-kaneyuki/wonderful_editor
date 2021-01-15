require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  ########################## index  start ##############################
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
  end
  ########################## index  end ################################

  ########################## show  start ################################
  describe "GET /show" do
    subject { get(api_v1_article_path(article_id)) }

    context "選択されたレコードに記事が存在する場合" do
      let(:article) { create(:article) }
      let(:article_id) { article.id }

      it "指定された記事が表示される" do
        subject
        res = JSON.parse(response.body)
        # binding.pry
        expect(response).to have_http_status(:ok)

        expect(res["title"]).to eq article.title
        expect(res["body"]).to eq article.body
        expect(res["user"]["id"]).to eq article.user.id
        # binding.pry
      end
    end

    context "選択されたレコードに記事が存在しない場合" do
      let(:article) { create(:article) }
      let(:article_id) { 10000 }
      it "指定された記事が表示されない" do
        # binding.pry
        # res = JSON.parse(response.body)
        # binding.pry

        expect { subject }.to raise_error ActiveRecord::RecordNotFound
        # binding.pry
      end
    end
  end
  ########################## show  end ##################################

  ########################## create  start ##################################
  describe "POST /create" do
    subject { post(api_v1_articles_path, params: params) }

    context "@articleが正常に機能する" do
      # binding.pry
      let(:params) { { article: FactoryBot.attributes_for(:article) } }

      it "記事が作成される" do
        subject

        expect(subject).to change { Article.count }.by(1)
      end
    end

    context "article_paramsの制限が通っている" do
      it "title,bodyのみ表示される" do
        # expect(target).to ___  ____
      end
    end

    context "@articleが正常に機能しない時" do
      it "記事が作成されない" do
        # expect(target).to ___  ____
      end
    end

    context "article_paramsの制限が通っていない" do
      it "title,body以外も表示される" do
        # expect(target).to ___  ____
      end
    end
  end
end
