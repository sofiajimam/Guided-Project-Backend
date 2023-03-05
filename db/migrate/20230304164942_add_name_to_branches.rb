class AddNameToBranches < ActiveRecord::Migration[7.0]
  def change
    add_column :branches, :name, :string
  end
end
