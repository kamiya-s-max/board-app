class RemoveExpertIdFromCategories < ActiveRecord::Migration[5.2]
  def change
    remove_reference :categories, :expert, foreign_key: true
  end
end
