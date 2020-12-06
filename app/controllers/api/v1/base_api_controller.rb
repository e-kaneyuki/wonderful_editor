class Api::V1::BaseApiController < ApplicationController
  def current_user
    @current_user ||= User.first
  end
end
