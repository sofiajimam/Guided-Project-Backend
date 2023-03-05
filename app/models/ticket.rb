class Ticket < ApplicationRecord
    belongs_to :machine
    belongs_to :author, polymorphic: true
    belongs_to :assignee, class_name: 'Employee', required: false

    has_and_belongs_to_many :common_failures
    validates_presence_of :common_failures

    enum :status, %i[unassigned pending in_progress done]

    belongs_to :branch

    delegate :company, to: :branch
    delegate :location, to: :branch
    delegate :name, to: :machine

    def assign(user)
      self.assignee = user
      self.status = :pending
      save
    end
end