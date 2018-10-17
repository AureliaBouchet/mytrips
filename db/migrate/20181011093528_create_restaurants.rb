class CreateRestaurants < ActiveRecord::Migration[5.2]
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :price
      t.boolean :love_tag
      t.references :step, foreign_key: true

      t.timestamps
    end
  end
end
