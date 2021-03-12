require "rails_helper"

RSpec.describe "Api::V1::Auth::Registrations", type: :request do

  describe "POST/registrations" do
    #主題 = subject(subjectをベースとしたテストを作ってみよう！ってヤツ)

############################### 正常系テスト ###############################
    subject { post(api_v1_user_registration_path, params: params) }

    context "リクエストが通っている場合" do
      let (:params) { attributes_for(:user) }

      it "ユーザーが登録される" do
        expect { subject }.to change { User.count }.by(1)
        expect(response).to have_http_status(200)
      end
    end
###### 真のゴールがなんなのかを考える！！！######
    context "headerをキチンと受け取れる" do
      let (:params) { attributes_for(:user) }
      it "header 情報を取得することができる" do
        subject
        header = response.header
        expect(header["access-token"]).to be_present
        expect(header["client"]).to be_present
        expect(header["expiry"]).to be_present
        expect(header["uid"]).to be_present
        expect(header["token-type"]).to be_present
      end
    end


###########################################


    context "Name/Emailが入力されている" do
      let (:params) { attributes_for(:user) }
      it "登録ができる" do
        subject
        res = JSON.parse(response.body)
        expect(res["data"]["name"]).to eq params[:name]
        expect(response).to have_http_status(200)
      end

      it "名前が登録される" do
        subject
        res = JSON.parse(response.body)
        expect(res["data"]["email"]).to eq params[:email]
        expect(response).to have_http_status(200)
      end
    end



############################### 異常系テスト ###############################

    context "適切な名前が入力されていない" do
      let (:params) { attributes_for(:user, name: nil) }
      it "新規登録ができない" do
        subject

        res = JSON.parse(response.body)
        expect(res["data"]["name"]).to eq params[:name]
        expect(response).to have_http_status(422)
        expect(res["errors"]["name"]).to include "can't be blank"
      end
    end


    context "適切なメールアドレスが入力されていない" do
      let (:params) { attributes_for(:user, email: nil) }
      it "新規登録ができない" do
        subject
        res = JSON.parse(response.body)

        expect(res["data"]["email"]).to eq params[:email]
        expect(response).to have_http_status(422)
        expect(res["errors"]["email"]).to include "can't be blank"
      end
    end


    context "適切なpasswordが入力されていない" do
      let (:params) { attributes_for(:user, password: nil) }
      it "新規登録ができない" do
        subject
        res = JSON.parse(response.body)

        expect(res["data"]["password"]).to eq params[:password]
        expect(response).to have_http_status(422)
        expect(res["errors"]["password"]).to include "can't be blank"
      end
    end

  end
end
