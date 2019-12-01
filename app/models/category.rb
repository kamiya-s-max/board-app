class Category < ApplicationRecord
  has_many :expert, dependent: :destroy
end
