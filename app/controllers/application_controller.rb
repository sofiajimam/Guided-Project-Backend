class ApplicationController < ActionController::API
  include ActiveModel::Serialization
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_action :authorize_request
  attr_reader :current_user

  private

  def authorize_request
    auth_header = request.headers['Authorization']
    if auth_header && auth_header.split(' ').length == 2
      token = auth_header.split(' ')[1]
      begin
        payload, _ = JWT.decode(token, Rails.application.credentials.jwt[:secret_key_base], true, algorithm: 'HS256')
        user_type = payload["type"].to_sym

        user_model = get_user_model(user_type)
        raise "Invalid user type: #{user_type}" unless user_model

        @current_user = {
          data: user_model.find_by(id: payload["sub"]["id"]),
          type: user_type
        }
      rescue JWT::DecodeError
        render json: { error: 'Invalid token' }, status: :unauthorized
      rescue => e
        render json: { error: e.message }, status: :unprocessable_entity
      end
    else
      render json: { error: 'Authorization header missing or malformed' }, status: :unprocessable_entity
    end
  end


  def get_user_model(user_type)
    case user_type
    when :admin
      Admin
    when :employee
      Employee
    end
  end
end
