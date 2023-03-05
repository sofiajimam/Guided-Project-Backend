module Types
  class MutationType < Types::BaseObject
    field :employee_create, mutation: Mutations::EmployeeCreate
    field :branch_create, mutation: Mutations::BranchCreate
    field :user_session_create, mutation: Mutations::UserSessionCreate
    field :ticket_delete, mutation: Mutations::TicketDelete
    field :ticket_create, mutation: Mutations::TicketCreate
    field :machine_delete, mutation: Mutations::MachineDelete
    field :machine_create, mutation: Mutations::MachineCreate
    field :common_failure_delete, mutation: Mutations::CommonFailureDelete
    field :common_failure_create, mutation: Mutations::CommonFailureCreate
    field :admin_create, mutation: Mutations::AdminCreate
  end
end
