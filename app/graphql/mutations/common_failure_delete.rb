# frozen_string_literal: true

module Mutations
  class CommonFailureDelete < BaseMutation
    description 'Deletes a common_failure by ID'

    field :common_failure, Types::CommonFailureType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      common_failure = ::CommonFailure.find_by(id: id)
      unless common_failure&.destroy
        raise GraphQL::ExecutionError.new 'Error deleting common failure',
                                          extensions: common_failure&.errors&.to_hash
      end

      { common_failure: common_failure }
    end

    def authorized?(*)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
