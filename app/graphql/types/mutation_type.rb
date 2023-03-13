module Types
  class MutationType < Types::BaseObject
    field :branch_delete, mutation: Mutations::BranchDelete
    field :company_delete, mutation: Mutations::CompanyDelete
    field :company_create, mutation: Mutations::CompanyCreate
    field :employee_delete, mutation: Mutations::EmployeeDelete
    field :admin_delete, mutation: Mutations::AdminDelete
    field :employee_create, mutation: Mutations::EmployeeCreate
    field :branch_create, mutation: Mutations::BranchCreate
    field :ticket_delete, mutation: Mutations::TicketDelete
    field :ticket_create, mutation: Mutations::TicketCreate
    field :machine_delete, mutation: Mutations::MachineDelete
    field :machine_create, mutation: Mutations::MachineCreate
    field :common_failure_delete, mutation: Mutations::CommonFailureDelete
    field :common_failure_create, mutation: Mutations::CommonFailureCreate
    field :admin_create, mutation: Mutations::AdminCreate
  end
end
