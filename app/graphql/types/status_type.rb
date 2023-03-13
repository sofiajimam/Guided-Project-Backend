# frozen_string_literal: true

module Types
  class StatusType < Types::BaseEnum
    description 'Status enum'

    value 'PENDING', value: :pending
    value 'IN_PROCESS', value: :in_progress
    value 'DONE', value: :done

    def self.coerce_result(ruby_value, _context)
      ruby_value.to_s
    end
  end
end
