class Category < ApplicationRecord
  belongs_to :expert

  # validation
  # name 空ではないか
  validates :name, presence: true
end
