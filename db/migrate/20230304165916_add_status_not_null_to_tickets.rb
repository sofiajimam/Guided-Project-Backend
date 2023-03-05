class AddStatusNotNullToTickets < ActiveRecord::Migration[7.0]
  def change
    add_column :tickets, :status, :integer, default: 0, null: 0
  end
end
