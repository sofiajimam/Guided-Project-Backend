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
        machine: Machine.find_by(id: ticket_input.machine_id),
        description: ticket_input.description,
        author: context[:current_user],
        assignee: Employee.find_by(id: ticket_input.assignee_id),
      )

      ticket.common_failures << CommonFailure.where(id: ticket_input.failures)

      # check that each common failures exists and specify which one
      raise GraphQL::ExecutionError, 'Common failure does not exist' unless ticket.common_failures.count == ticket_input.failures.count
      raise GraphQL::ExecutionError.new 'Error creating ticket', extensions: ticket.errors.to_hash unless ticket.save

      { ticket: ticket }
    end

    def authorized?(ticket_input:)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
