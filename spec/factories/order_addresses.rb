FactoryBot.define do
  factory :order_address do
    token {"tok_abcdefghijk00000000000000000"}
    post_code {"123-1234"}
    shipping_area_id {2}
    municipality {"横浜市緑区"}
    address {"青山1-1-1"}
    building_name {"wwwビル"}
    phone_number {"09011112222"}
  end
end