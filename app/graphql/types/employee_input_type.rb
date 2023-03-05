# frozen_string_literal: true

module Types
  class EmployeeInputType < Types::BaseInputObject
    argument :name, String, required: false
    argument :email, String, required: false

    argument :password, String, required: false
    argument :password_confirmation, String, required: false
  end
end
