module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # get admin by id
    field :admin, Types::AdminType, null: true do
      description "Find an admin by ID"
      argument :id, ID, required: true
    end

    def admin(id:)
      ::Admin.find(id)
    end

    # get all admins
    field :admins, [Types::AdminType], null: false do
      description "Get all admins"
    end

    def admins
      unauthorized unless context[:current_user_type] == :admin
      ::Admin.all
    end

    # get all common failures
    field :common_failures, [Types::CommonFailureType], null: false do
      description "Get all common failures"
    end

    def common_failures
      unauthorized unless context[:current_user_type] == :admin
      ::CommonFailure.all
    end

    # get all machines
    field :machines, [Types::MachineType], null: false do
      description "Get all machines"
    end

    def machines
      unauthorized unless context[:current_user_type] == :admin
      ::Machine.all
    end

    # get all tickets
    field :tickets, [Types::TicketType], null: false do
      description "Get all tickets"
    end

    def tickets
      unauthorized unless context[:current_user_type] == :admin
      ::Ticket.all
    end

    # get all branches
    field :branches, [Types::BranchType], null: false do
      description "Get all branches"
    end

    def branches
      unauthorized unless context[:current_user_type] == :admin
      ::Branch.all
    end

    # get all companies
    field :companies, [Types::CompanyType], null: false do
      description "Get all companies"
    end

    def companies
      unauthorized unless context[:current_user_type] == :admin
      ::Company.all
    end

    # get all employees
    field :employees, [Types::EmployeeType], null: false do
      description "Get all employees"
    end

    def employees
      unauthorized unless context[:current_user_type] == :admin
      ::Employee.all
    end

    # get current employee
    field :current_employee, Types::EmployeeType, null: true do
      description "Get current employee"
    end

    def current_employee
      unauthorized unless context[:current_user_type] == :employee
      context[:current_user]
    end

    # get current admin
    field :current_admin, Types::AdminType, null: true do
      description "Get current admin"
    end

    def current_admin
      unauthorized unless context[:current_user_type] == :admin
      context[:current_user]
    end

    # get company by id
    field :company, Types::CompanyType, null: true do
      description "Find a company by ID"
      argument :id, ID, required: true
    end

    def company(id:)
      unauthorized unless context[:current_user_type] == :admin
      ::Company.find(id)
    end
  end
end
