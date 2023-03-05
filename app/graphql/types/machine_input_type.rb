# frozen_string_literal: true

module Types
  class MachineInputType < Types::BaseInputObject
    argument :name, String, required: false
  end
end
