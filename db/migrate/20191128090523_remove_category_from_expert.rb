class RemoveCategoryFromExpert < ActiveRecord::Migration[5.2]
  def change
    remove_reference :experts, :category, foreign_key: true
  end
end
