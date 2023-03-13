module Mutations
  class AdminDelete < BaseMutation
    description 'Deletes an admin by ID'

    field :admin, Types::AdminType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      admin = ::Admin.find_by(id: id)

      raise GraphQL::ExecutionError, 'Admin not found' unless admin

      unless admin&.destroy
        raise GraphQL::ExecutionError.new 'Error deleting admin',
          extensions: admin&.errors&.to_hash
      end

      { admin: admin }
    end

    def authorized?(*)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
