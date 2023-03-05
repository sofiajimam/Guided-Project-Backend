# frozen_string_literal: true

module Types
  class EmployeeType < Types::BaseObject
    field :id, ID, null: false

    field :email, String
    field :name, String

    field :tickets, [Types::TicketType]
    field :ticket, Types::TicketType do
      argument :id, ID
    end
    def ticket(id:)
      object.tickets.find_by(id: id)
    end

    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
