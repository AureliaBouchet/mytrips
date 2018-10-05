class CreateTrips < ActiveRecord::Migration[5.2]
  def change
    create_table :trips do |t|
      t.string :title
      t.date :date_begin
      t.date :date_end

      t.timestamps
    end
  end
end
