class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  skip_before_action :verify_authenticity_token
  # binding.pry

  private

    def sign_up_params
      # binding.pry
      params.permit(:name, :email, :password)
    end
end
