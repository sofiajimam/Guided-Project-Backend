class AddNameToCommonFailures < ActiveRecord::Migration[7.0]
  def change
    add_column :common_failures, :name, :string
  end
end
