class Expert < ApplicationRecord
  belongs_to :user, optional: true
  has_one :category, dependent: :destroy
  accepts_nested_attributes_for :category

  # validation
  # name 空白ではないか、 最大２０文字
  validates :name, presence: true, length: { maximum: 20}
  # career 空白ではないか
  validates :career, presence: true

end
