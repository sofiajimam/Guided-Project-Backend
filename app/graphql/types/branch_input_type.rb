# frozen_string_literal: true

module Types
  class BranchInputType < Types::BaseInputObject
    argument :name, String, required: true
    argument :company_id, ID, required: true
    argument :location, Types::LocationInputType, required: false
  end
end
