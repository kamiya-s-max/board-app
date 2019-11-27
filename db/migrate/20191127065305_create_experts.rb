class CreateExperts < ActiveRecord::Migration[5.2]
  def change
    create_table :experts do |t|
      t.string :name,         null: false, index: true
      t.text :text
      t.string :career,       null: false
      t.string :contact
      t.references :user,     foreign_key: true
      t.references :category, foreign_key: true
      t.timestamps
    end
  end
end
