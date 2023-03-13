# frozen_string_literal: true

module Mutations
  class TicketCreate < BaseMutation
    description 'Creates a new ticket'

    field :ticket, Types::TicketType, null: false

    argument :ticket_input, Types::TicketInputType, required: true

    def resolve(ticket_input:)
      branch = Branch.find_by(id: ticket_input.branch_id)
      raise GraphQL::ExecutionError, 'Branch does not exist' unless branch

      company = context[:current_user_type] == :admin ? branch.company : context[:current_user].company

      ticket = ::Ticket.new(
        branch: branch,
        machine: company.machines.find_by(id: ticket_input.machine_id),
        description: ticket_input.description,
        author: context[:current_user]
      )

      ticket.common_failures << CommonFailure.where(id: ticket_input.failures)
      raise GraphQL::ExecutionError.new 'Error creating ticket', extensions: ticket.errors.to_hash unless ticket.save

      { ticket: ticket }
    end

    def authorized?(ticket_input:)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
