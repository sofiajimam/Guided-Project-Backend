# frozen_string_literal: true

module Types
  class CommonFailureInputType < Types::BaseInputObject
    argument :title, String, required: true
  end
end
