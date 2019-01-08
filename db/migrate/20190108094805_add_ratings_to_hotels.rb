class AddRatingsToHotels < ActiveRecord::Migration[5.2]
  def change
    add_column :hotels, :rating, :string
  end
end
