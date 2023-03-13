module Mutations
  class CompanyCreate < BaseMutation
    description 'Creates a new company'

    field :company, Types::CompanyType, null: false
    argument :company_input, Types::CompanyInputType, required: true

    def resolve(company_input:)
      company = ::Company.new(**company_input)
      raise GraphQL::ExecutionError.new 'Error creating company', extensions: company.errors.to_hash unless company.save

      { company: company }
    end

    def authorized?(*)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
