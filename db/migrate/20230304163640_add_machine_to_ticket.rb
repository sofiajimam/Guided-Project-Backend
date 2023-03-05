class AddMachineToTicket < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :machine, index: true
  end
end
