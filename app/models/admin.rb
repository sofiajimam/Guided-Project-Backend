class Admin < User
    has_many :tickets, as: :author
end
