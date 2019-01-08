class AddNightsToSteps < ActiveRecord::Migration[5.2]
  def change
    add_column :steps, :night, :integer
  end
end
