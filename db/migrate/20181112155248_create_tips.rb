class CreateTips < ActiveRecord::Migration[5.2]
  def change
    create_table :tips do |t|
      t.string :tip
      t.references :trip, foreign_key: true

      t.timestamps
    end
  end
end
