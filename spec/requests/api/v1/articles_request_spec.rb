require "rails_helper"

RSpec.describe "Api::V1::Articles", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/api/v1/articles"
      # get "/api/v1/articles/index"だと以下のエラー文が出てきちゃう
      # よくよく見るとshowメソッドになっちゃってた
      # AbstractController::ActionNotFound:
      # The action 'show' could not be found for Api::V1::ArticlesController
      expect(response).to have_http_status(:success)
    end
  end
end
