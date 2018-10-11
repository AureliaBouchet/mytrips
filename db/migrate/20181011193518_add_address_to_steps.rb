class AddAddressToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :address, :string
    add_column :steps, :latitude, :float
    add_column :steps, :longitude, :float
  end
end
