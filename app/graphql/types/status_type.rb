# frozen_string_literal: true

module Types
  class StatusType < Types::BaseEnum
    description 'Status enum'

    value 'PENDING', value: :pending
    value 'IN_PROCESS', value: :in_progress
    value 'DONE', value: :done
  end
end
