# frozen_string_literal: true

module Types
  class CompanyType < Types::BaseObject
    field :id, ID, null: false

    field :name, String

    field :tickets, [Types::TicketType]

    field :branches, [Types::BranchType]

    field :branch, Types::BranchType do
      argument :id, ID
    end

    def branch(id:)
      object.branches.find_by(id: id)
    end

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
