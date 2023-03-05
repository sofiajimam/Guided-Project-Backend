class Company < ApplicationRecord
    validates :name, presence: true

    # has_many :tickets, dependent: :destroy
    has_many :branches, dependent: :destroy
    has_many :tickets, through: :branches
end
