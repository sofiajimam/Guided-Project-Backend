# frozen_string_literal: true

module Types
  class MachineType < Types::BaseObject
    field :id, ID, null: false

    field :name, String

    field :companies, [Types::CompanyType]
    def companies
      unauthorized_field unless context[:current_user_type] == :admin
      object.companies
    end

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
