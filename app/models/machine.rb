class Machine < ApplicationRecord
    has_many :tickets

    validates :name, presence: true
end
