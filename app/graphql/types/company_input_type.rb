# frozen_string_literal: true

module Types
  class CompanyInputType < Types::BaseInputObject
    argument :name, String, required: false
  end
end
