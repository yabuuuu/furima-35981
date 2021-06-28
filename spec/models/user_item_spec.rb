require 'rails_helper'

RSpec.describe UserItem, type: :model do
  before do
    @item_user = FactoryBot.build(:item_user)
  end

  context '内容に問題ない場合' do
    it "priceとtokenがあれば保存ができること" do
      expect(@item_user).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it "tokenが空では登録できないこと" do
      @item_user.token = nil
      @item_user.valid?
      expect(@item_user.errors.full_messages).to include("Token can't be blank")
    end
  end
end
