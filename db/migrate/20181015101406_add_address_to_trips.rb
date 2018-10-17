class AddAddressToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :address, :string
    add_column :trips, :latitude, :float
    add_column :trips, :longitude, :float
  end
end
