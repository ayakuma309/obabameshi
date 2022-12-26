class Item < ApplicationRecord
  has_many :happies, dependent: :destroy
  has_many :angries, dependent: :destroy
  has_many :normals, dependent: :destroy
end
