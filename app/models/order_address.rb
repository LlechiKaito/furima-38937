class OrderAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :shipping_area_id, :municipality, :address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :post_code
    validates :municipality
    validates :address
    validates :building_name
    validates :phone_number
    validates :token
  end
  validates :shipping_area_id, numericality: { other_than: 0, message: "can't be blank" }

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Address.create(post_code: post_code, shipping_area_id: shipping_area_id, municipality: municipality, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end