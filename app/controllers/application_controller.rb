class ApplicationController < ActionController::API
    def authenticate
        token = request.headers["Authorization"].split(" ").last

        payload, _ = JWT.decode(token, "secret", true, { algorithm: "HS256" }).first
        user_type = payload["type"].to_sym

        @current_user = {
          data: get_user_model(user_type).find_by(id: payload["sub"]["id"]),
          type: user_type
        }
    rescue
    end

    def authenticate!
      authenticate if request.headers['Authorization'] && !@current_user
      unless @current_user
        raise_unauthorized_error
      end
    end

    def raise_unauthorized_error
      render json: { errors: [ "You are not allowed to perform this action" ] }, status: :unauthorized
    end

    def get_user_model(user_type)
      case user_type
      when :admin
        Admin
      when :employee
        Employee
      else
        Employee
      end
    end
end
