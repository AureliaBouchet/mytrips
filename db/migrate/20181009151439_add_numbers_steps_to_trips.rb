class AddNumbersStepsToTrips < ActiveRecord::Migration[5.2]
  def change
    add_column :trips, :number_steps, :integer, default: 0
  end
end
