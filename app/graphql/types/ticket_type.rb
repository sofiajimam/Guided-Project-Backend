# frozen_string_literal: true

module Types
  class TicketType < Types::BaseObject
    field :id, ID, null: false

    field :name, String
    field :description, String

    field :status, Types::StatusType
    field :location, Types::LocationType, null: true

    field :company, Types::TicketType, null: false
    field :machine, Types::MachineType, null: false
    field :branch, Types::BranchType
    field :common_failures, [Types::CommonFailureType]

    field :author, Types::AuthorType
    field :assignee, Types::EmployeeType

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
