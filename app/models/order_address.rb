class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :municipality
    validates :address
    validates :phone_number
    validates :token
  end
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }
  validates :post_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: "isn't 3桁ハイフン4桁" }
  validates :phone_number, format: { with: /\A\d{10,11}\z/, message: "isn't 10桁以上11桁以下" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end