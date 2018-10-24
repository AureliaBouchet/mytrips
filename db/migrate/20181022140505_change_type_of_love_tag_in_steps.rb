class ChangeTypeOfLoveTagInSteps < ActiveRecord::Migration[5.2]
  def change
    change_column :steps, :love_tag, :string
  end
end
