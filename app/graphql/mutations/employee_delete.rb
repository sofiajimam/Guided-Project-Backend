module Mutations
  class EmployeeDelete < BaseMutation
    description 'Deletes an employee by ID'

    field :employee, Types::EmployeeType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      employee = ::Employee.find_by(id: id)

      raise GraphQL::ExecutionError, 'Employee not found' unless employee

      unless employee&.destroy
        raise GraphQL::ExecutionError.new 'Error deleting employee',
          extensions: employee&.errors&.to_hash
      end

      { employee: employee }
    end

    def authorized?(*)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
