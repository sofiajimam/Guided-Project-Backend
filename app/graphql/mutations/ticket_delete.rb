module Mutations
  class TicketDelete < BaseMutation
    description 'Deletes a ticket by ID'

    field :ticket, Types::TicketType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      ticket = ::Ticket.find_by(id: id)
      raise GraphQL::ExecutionError.new 'Error deleting ticket', extensions: ticket&.errors&.to_hash unless ticket&.destroy

      { ticket: ticket }
    end

    def authorized?(*)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
