class CreateCommonFailures < ActiveRecord::Migration[7.0]
  def change
    create_table :common_failures do |t|

      t.timestamps
    end
  end
end
