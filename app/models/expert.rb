class Expert < ApplicationRecord
  belongs_to :user, optional: true
  belongs_to :category

  # validation
  # name 空白ではないか、 最大２０文字
  validates :name, presence: true, length: { maximum: 20}
  # career 空白ではないか
  validates :career, presence: true
  # category_id 空ではないか
  validates :category_id, presence: true

end
