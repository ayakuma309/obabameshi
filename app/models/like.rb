class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :item_id }
  validates :user_id, presence: true, uniqueness: { scope: :type }
  validates :item_id, presence: true, uniqueness: { scope: :type }
end
