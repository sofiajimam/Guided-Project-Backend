class AddAuthorToTickets < ActiveRecord::Migration[7.0]
  def change
    add_reference :tickets, :author, polymorphic: true
  end
end
