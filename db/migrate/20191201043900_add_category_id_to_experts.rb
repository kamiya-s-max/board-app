class AddCategoryIdToExperts < ActiveRecord::Migration[5.2]
  def change
    add_reference :experts, :category, index: true
  end
end
