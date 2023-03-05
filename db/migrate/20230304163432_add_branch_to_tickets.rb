class AddBranchToTickets < ActiveRecord::Migration[7.0]
  def change
      add_reference :tickets, :branch, foreign_key: true
  end
end
