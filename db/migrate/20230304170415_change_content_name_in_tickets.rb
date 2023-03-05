class ChangeContentNameInTickets < ActiveRecord::Migration[7.0]
  def change
    rename_column :tickets, :content, :description
  end
end
