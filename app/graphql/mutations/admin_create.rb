# frozen_string_literal: true

module Mutations
  class AdminCreate < BaseMutation
    description 'Creates a new admin'

    field :admin, Types::AdminType, null: false

    argument :admin_input, Types::AdminInputType, required: true

    def resolve(admin_input:)
      admin = ::Admin.new(**admin_input)
      raise GraphQL::ExecutionError.new 'Error creating admin', extensions: admin.errors.to_hash unless admin.save

      { admin: admin }
    end

    def authorized?(*)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
