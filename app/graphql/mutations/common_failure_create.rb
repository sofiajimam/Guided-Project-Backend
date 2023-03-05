# frozen_string_literal: true

module Mutations
  class CommonFailureCreate < BaseMutation
    description 'Creates a new common_failure'

    field :common_failure, Types::CommonFailureType, null: false

    argument :common_failure_input, Types::CommonFailureInputType, required: true

    def resolve(common_failure_input:)
      common_failure = ::CommonFailure.new(**common_failure_input)
      unless common_failure.save
        raise GraphQL::ExecutionError.new 'Error creating common_failure',
                                          extensions: common_failure.errors.to_hash
      end

      { common_failure: common_failure }
    end

    def authorized?(*)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
