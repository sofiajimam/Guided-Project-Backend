require 'jwt'

class SessionsController < ApplicationController
    skip_before_action :authorize_request, only: :create

    def create
        user = User.find_by(email: params[:email])
        &.authenticate(params[:password])
        raise GraphQL::ExecutionError.new "Incorrect email or password" unless user

        if user
            payload = {
                sub: user.as_json(except: [ :password_digest ]),
                type: user.class.name.underscore
            }

            token = encode_token(payload)
            render json: { token: token, session_type: payload[:type] }
        else
            render json: { error: 'Invalid email or password' }, status: :unprocessable_entity
        end
    end

    def encode_token(payload)
        JWT.encode(payload, Rails.application.credentials.jwt[:secret_key_base], 'HS256')
    end
end