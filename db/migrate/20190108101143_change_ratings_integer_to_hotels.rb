class ChangeRatingsIntegerToHotels < ActiveRecord::Migration[5.2]
  def change
    change_column :hotels, :rating, :integer, using: 'rating::integer'
  end
end
