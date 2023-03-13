module Mutations
  class CompanyDelete < BaseMutation
    description 'Deletes a company by ID'

    field :company, Types::CompanyType, null: false

    argument :id, ID, required: true

    def resolve(id:)
      company = ::Company.find_by(id: id)

      raise GraphQL::ExecutionError, 'Company not found' unless company

      unless company&.destroy
        raise GraphQL::ExecutionError.new 'Error deleting company',
          extensions: company&.errors&.to_hash
      end

      { company: company }
    end

    def authorized?(*)
      return true if context[:current_user_type] == :admin

      raise GraphQL::ExecutionError, 'You are not allowed to perform this action'
    end
  end
end
