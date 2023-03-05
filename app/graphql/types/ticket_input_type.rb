# frozen_string_literal: true

module Types
  class TicketInputType < Types::BaseInputObject
    argument :description, String, required: false
    argument :branch_id, ID
    argument :machine_id, ID
    argument :failures, [ID]
  end
end
