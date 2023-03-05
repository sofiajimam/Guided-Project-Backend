class Branch < ApplicationRecord
    belongs_to :company
    has_one :location, as: :locatable, dependent: :destroy, required: true

    has_many :tickets, dependent: :destroy
  end