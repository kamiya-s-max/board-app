class Category < ApplicationRecord
  has_many :experts, dependent: :destroy
end
