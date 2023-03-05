module ApplicationCable
  class Connection < ActionCable::Connection::Base
    identified_by :current_user

    def connect
      self.current_user = find_verified_user
    end

    private
    def find_verified_user
      token = request.params[:token]

      payload, _ = JWT.decode token, "secret", true, { algorithm: 'HS256' }
      user_type = payload["type"].to_sym

      current_user = {
        data: get_user_model(user_type).find_by(id: payload["sub"]["id"]),
        type: user_type
      }
    rescue
      reject_unauthorized_connection
    end

    def get_user_model(type)
      case type
      when :admin
        Admin
      when :employee
        Employee
      else
        Employee
      end
    end
  end
end
