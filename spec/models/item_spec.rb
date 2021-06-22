require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    #@user = FactoryBot.build(:user)
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    context '商品を出品できるとき' do
      it '全ての項目を入力できていたら出品できる' do
        expect(@item).to be_valid
      end
    end

    context '商品を出品できないとき' do
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include"Image can't be blank"
      end
      it '商品説明がないと出品できない' do
        @item.description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Description can't be blank"
      end
      it 'カテゴリーが---では出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include"Category must be other than 1"
      end
      it '商品状態が---では出品できない' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include"Condition must be other than 1"
      end
      it '送料負担が---では出品できない' do
        @item.shipping_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include"Shipping burden must be other than 1"
      end
      it '発送元の地域が---では出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include"Shipping area must be other than 1"
      end
      it '発送までの日数の情報が---では出品できない' do
        @item.shipping_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include"Shipping date must be other than 1"
      end
      it '価格がないと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include"Price can't be blank"
      end
      it '価格が300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include"Price must be greater than or equal to 300"
      end
      it '価格が9,999,999より大きいと出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include"Price must be less than or equal to 9999999"
      end
      it '価格が全角だと出品できない' do
        @item.price = '１８００'
        @item.valid?
        expect(@item.errors.full_messages).to include"Price is not a number"
      end
      it '価格が半角英数字混合では出品できない' do
        @item.price = 'a1800'
        @item.valid?
        expect(@item.errors.full_messages).to include"Price is not a number"
      end
      it '価格が半角英字のみでは出品できない' do
        @item.price = 'aaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include"Price is not a number"
      end
    end
  end
end
