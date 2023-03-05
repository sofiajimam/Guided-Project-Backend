class CreateTicketCommonFailuresJoinTable < ActiveRecord::Migration[7.0]
  def change
    create_join_table :tickets, :common_failures do |t|
      t.index :ticket_id
      t.index :common_failure_id
    end
  end
end
