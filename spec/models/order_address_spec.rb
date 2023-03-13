require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @item = FactoryBot.create(:item)
    @user = FactoryBot.create(:user)
    @order_address = FactoryBot.build(:order_address, item_id: @item.id, user_id: @user.id)
  end

  context '内容に問題ない場合' do
    it "全ての項目を満たせば保存ができること" do
      expect(@order_address).to be_valid
    end
    it "building_nameが空でも保存ができること" do
      @order_address.building_name = ''
      expect(@order_address).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @order_address.token = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it "post_codeが空では登録できないこと" do
      @order_address.post_code = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it "post_codeが数字3桁ハイフン数字4桁ではない場合登録できないこと" do
      @order_address.post_code = "1234567"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Post code isn't 3桁ハイフン4桁")
    end
    it "shipping_area_idが0では登録できないこと" do
      @order_address.shipping_area_id = 0
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Shipping area can't be blank")
    end
    it "municipalityが空では登録できないこと" do
      @order_address.municipality = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Municipality can't be blank")
    end
    it "addressが空では登録できないこと" do
      @order_address.address = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address can't be blank")
    end
    it "phone_numberが空では登録できないこと" do
      @order_address.phone_number = ""
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "phone_numberが数字9桁以下ではでは登録できないこと" do
      @order_address.phone_number = "123456789"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number isn't 10桁以上11桁以下")
    end
    it "phone_numberが数字12桁以上ではでは登録できないこと" do
      @order_address.phone_number = "123456789123"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number isn't 10桁以上11桁以下")
    end
    it "item_idが空では登録できないこと" do
      @order_address.item_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Item can't be blank")
    end
    it "user_idが空では登録できないこと" do
      @order_address.user_id = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("User can't be blank")
    end
  end
end
