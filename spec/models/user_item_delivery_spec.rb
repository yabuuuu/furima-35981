require 'rails_helper'

RSpec.describe UserItemDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @user_item_delivery = FactoryBot.build(:user_item_delivery, user_id: user.id,  item_id: item.id)
    sleep 0.1  
  end

  describe '商品購入機能' do
    context '内容に問題ない場合' do
      it 'priceとtokenがあれば保存ができること' do
        expect(@user_item_delivery).to be_valid
      end

      it 'buildingは空でも保存できること' do
        @user_item_delivery.building  = ''
        expect(@user_item_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it "tokenが空では登録できないこと" do
        @user_item_delivery.token = nil
        @user_item_delivery.valid?
        expect( @user_item_delivery.errors.full_messages).to include("Token can't be blank")
      end

      it 'zip_codeが空だと保存できないこと' do
        @user_item_delivery.zip_code = ''
        @user_item_delivery.valid?
        expect( @user_item_delivery.errors.full_messages).to include("Zip code can't be blank")
      end

      it 'zip_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_item_delivery.zip_code = '1234567'
        @user_item_delivery.valid?
        expect( @user_item_delivery.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
      end

      it 'shipping_area_idを選択していないと保存できないこと' do
        @user_item_delivery.shipping_area_id = 1
        @user_item_delivery.valid?
        expect(@user_item_delivery.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it 'municipalitiesが空だと保存できないこと' do
        @user_item_delivery.municipalities = ''
        @user_item_delivery.valid?
        expect( @user_item_delivery.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空だと保存できないこと' do
        @user_item_delivery.address = ''
        @user_item_delivery.valid?
        expect( @user_item_delivery.errors.full_messages).to include("Address can't be blank")
      end

      it 'telが空だと保存できないこと' do
        @user_item_delivery.tel = ''
        @user_item_delivery.valid?
        expect( @user_item_delivery.errors.full_messages).to include("Tel can't be blank")
      end

      it 'telにハイフンがあると保存できないこと' do
        @user_item_delivery.tel = '123-1234-1234'
        @user_item_delivery.valid?
        expect( @user_item_delivery.errors.full_messages).to include("Tel is not a number")
      end

      it 'telが９桁だと保存できないこと' do
        @user_item_delivery.tel = 123456789
        @user_item_delivery.valid?
        expect( @user_item_delivery.errors.full_messages).to include("Tel is invalid")
      end

      it 'telが全角だと保存できないこと' do
        @user_item_delivery.tel = '１２３１２３４１２３４'
        @user_item_delivery.valid?
        expect( @user_item_delivery.errors.full_messages).to include("Tel is invalid")
      end

      it 'userが紐付いていないと保存できないこと' do
        @user_item_delivery.user_id = nil
        @user_item_delivery.valid?
        expect(@user_item_delivery.errors.full_messages).to include("User can't be blank")
      end

      it 'itemが紐付いていないと保存できないこと' do
        @user_item_delivery.item_id = nil
        @user_item_delivery.valid?
        expect(@user_item_delivery.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
