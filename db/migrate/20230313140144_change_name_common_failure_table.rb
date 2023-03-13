class ChangeNameCommonFailureTable < ActiveRecord::Migration[7.0]
  def change
    rename_column :common_failures, :name, :title
  end
end
