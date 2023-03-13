module Mutations
  class BranchDelete < BaseMutation
    description 'Deletes a branch by ID'

    field :branch, Types::BranchType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      branch = ::Branch.find_by(id: id)

      raise GraphQL::ExecutionError, 'Branch not found' unless branch

      unless branch&.destroy
        raise GraphQL::ExecutionError.new 'Error deleting branch',
          extensions: branch&.errors&.to_hash
      end

      { branch: branch }
    end

    def authorized?(*)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
