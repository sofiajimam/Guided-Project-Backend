# frozen_string_literal: true

module Mutations
  class MachineCreate < BaseMutation
    description 'Creates a new machine'

    field :machine, Types::MachineType, null: false
    argument :machine_input, Types::MachineInputType, required: true

    def resolve(machine_input:)
      machine = ::Machine.new(**machine_input)
      raise GraphQL::ExecutionError.new 'Error creating machine', extensions: machine.errors.to_hash unless machine.save

      { machine: machine }
    end

    def authorized?(*)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
