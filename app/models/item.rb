class Item < ApplicationRecord
  belongs_to :user
  has_one :order
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :condition
  belongs_to :shipping_fee
  belongs_to :shipping_area
  belongs_to :days_left
  belongs_to :category

  validates :name, presence: true
  validates :price, numericality: { only_integer: true }, inclusion: { in: 300..9_999_999 }, format: { with: /\A[0-9]+\z/ }
  validates :content, presence: true
  validates :condition_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_fee_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :days_left_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :category_id, numericality: { other_than: 0, message: "can't be blank" }

  validates :image, presence: true, blob: { content_type: :image }
end
