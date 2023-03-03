class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :name, presence: true
  validates :price, presence: true
  validates :content, presence: true
  validates :condition_id, presence: true
  validates :shipping_fee_id, presence: true
  validates :shipping_area_id, presence: true
  validates :days_left_id, presence: true
  validates :category_id, presence: true
  validates :image, attached_file_presence: true

end
