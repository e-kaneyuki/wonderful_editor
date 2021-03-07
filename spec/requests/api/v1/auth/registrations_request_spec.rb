require "rails_helper"

RSpec.describe "Api::V1::Auth::Registrations", type: :request do

  describe "POST/registrations" do
    #主題 = subject(subjectをベースとしたテストを作ってみよう！ってヤツ)
    subject { post(api_v1_user_registration_path, params: params) }

    context "リクエストが通っている場合" do
      # binding.pry
      let (:params) { attributes_for(:user) }
      # binding.pry
      fit "レスポンスが返ってくる" do
        # binding.pry
        # expect(response).to have_http_status 200
        expect { subject }.to change { User.count }.by(1)

      end
    end



    # context "適切なパラメーターが入力されている" do
    #   # binding.pry
    #   let (:params) { { user: attributes_for(:user) } }
    #   # binding.pry
    #   fit "レスポンスが返ってくる" do
    #     # binding.pry
    #     expect(response.status).to eq(200)
    #     expect { subject }.to change { User.count }.by(1)

    #   end
    # end

    #パラメーターが許可されているか否か


    # パラメーターが重複していないか


    # パラメーターの記号がルールに沿っているか(大文字が小文字か)(記号の可否)

  end
end
