class AddAttributesToLocations < ActiveRecord::Migration[7.0]
  def change
    add_column :locations, :city, :string
    add_column :locations, :state, :string
    add_column :locations, :country, :string
    add_column :locations, :lat, :float
    add_column :locations, :lng, :float
    add_reference :locations, :locatable, polymorphic: true, index: true
  end
end
