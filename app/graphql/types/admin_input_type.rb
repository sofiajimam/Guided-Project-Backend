# frozen_string_literal: true

module Types
  class AdminInputType < Types::BaseInputObject
    argument :email, String, required: false
    argument :name, String, required: false

    argument :password, String, required: false
    argument :password_confirmation, String, required: false
  end
end
