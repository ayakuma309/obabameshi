class User < ApplicationRecord
  authenticates_with_sorcery!

  has_many :happies, dependent: :destroy
  has_many :angries, dependent: :destroy
  has_many :normals, dependent: :destroy
  has_many :happy_items, through: :happies, source: :item
  has_many :normal_items, through: :normals, source: :item
  has_many :angry_items, through: :angries, source: :item

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  #一行にまとめる
  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 255 }

  def happy?(item)
    happy_items.include?(item)
  end

  def normal?(item)
    normal_items.include?(item)
  end

  def angry?(item)
    angry_items.include?(item)
  end
end
