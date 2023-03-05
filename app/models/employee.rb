class Employee < User
    has_many :tickets, foreign_key: :assignee_id
end
