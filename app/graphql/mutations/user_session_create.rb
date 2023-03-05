# frozen_string_literal: true

module Mutations
  class UserSessionCreate < BaseMutation
    description "Creates a new user_session"

    field :token, String
    field :session_type, String

    argument :email, String, required: true
    argument :password, String, required: true

    def resolve(email:, password:)
      puts "EMAIL: #{email}"
      user = User
        .find_by(email: email)
        &.authenticate(password)
      raise GraphQL::ExecutionError.new "Incorrect email or password" unless user

      # print
      puts "user: #{user.as_json(except: [ :password_digest ])}"
      puts "user.class.name: #{user.class.name}"

      payload = {
        sub: user.as_json(except: [ :password_digest ]),
        type: user.class.name.underscore,
      }

      token = JWT.encode payload, "secret", 'HS256'

      { token: token, session_type: payload[:type] }
    end
  end
end
