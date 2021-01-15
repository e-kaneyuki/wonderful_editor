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
  # describe "POST /articles" do
  #   subject { post(api_v1_articles_path, params: params) }

  #   let(:params) { { article: attributes_for(:article) } }
  #   let(:current_user) { create(:user) }

  #   let(:my_instance) { instance_double(Api::V1::BaseApiController) }

  #   before do
  #     allow(Api::V1::BaseApiController).to receive(:new).and_return(my_instance)
  #     allow(my_instance).to receive(:current_user).and_return(current_user)
  #   end
  #   # before { allow_any_instance_of(Api::V1::BaseApiController).to receive(:current_user).and_return(current_user) }

  #   it "記事のレコードが作成できる" do
  #     expect { subject }.to change { Article.where(user_id: current_user.id).count }.by(1)
  #     res = JSON.parse(response.body)
  #     expect(res["title"]).to eq params[:article][:title]
  #     expect(res["body"]).to eq params[:article][:body]
  #     expect(response).to have_http_status(:ok)
  #   end
  # end
  ########################## create  end ##################################
end
