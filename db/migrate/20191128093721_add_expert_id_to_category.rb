class AddExpertIdToCategory < ActiveRecord::Migration[5.2]
  def change
    add_reference :categories, :expert, foreign_key: true
  end
end
