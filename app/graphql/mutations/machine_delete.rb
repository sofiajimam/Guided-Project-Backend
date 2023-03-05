module Mutations
  class MachineDelete < BaseMutation
    description 'Deletes a machine by ID'

    field :machine, Types::MachineType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      machine = ::Machine.find_by(id: id)
      raise GraphQL::ExecutionError.new 'Error deleting machine', extensions: machine&.errors&.to_hash unless machine&.destroy

      { machine: machine }
    end

    def authorized?(*)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
