class Api::V1::Auth::RegistrationsController < DeviseTokenAuth::RegistrationsController
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/auth/registrations'
    }
end
