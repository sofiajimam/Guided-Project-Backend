class CreateBranches < ActiveRecord::Migration[7.0]
  def change
    create_table :branches do |t|

      t.timestamps
    end
  end
end
