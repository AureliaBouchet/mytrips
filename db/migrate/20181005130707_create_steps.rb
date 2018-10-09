class CreateSteps < ActiveRecord::Migration[5.2]
  def change
    create_table :steps do |t|
      t.references :trip, foreign_key: true
      t.string :place
      t.date :date_begin
      t.date :date_end
      t.string :hotel
      t.integer :hotel_price
      t.text :comment
      t.boolean :love_tag

      t.timestamps
    end
  end
end
