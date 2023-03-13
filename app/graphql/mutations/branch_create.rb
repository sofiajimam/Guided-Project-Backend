# frozen_string_literal: true

module Mutations
  class BranchCreate < BaseMutation
    description 'Creates a new branch'

    field :branch, Types::BranchType, null: false
    argument :branch_input, Types::BranchInputType, required: true

    def resolve(branch_input:)
      company = resolve_company(branch_input.company_id)
      branch = company.branches.build(name: branch_input.name)
      branch.location = ::Location.new(**branch_input.location)

      raise GraphQL::ExecutionError.new 'Error creating branch', extensions: branch.errors.to_hash unless branch.save

      { branch: branch }
    end

    def resolve_company(company_id)
      Company.find_by(id: company_id)
    end

    def authorized?(branch_input:)
      return true if context[:current_user_type] == :admin
      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
