class Expert < ApplicationRecord
  belongs_to :user, optional: true
  has_one :category, dependent: :destroy
  accepts_nested_attributes_for :category
end
