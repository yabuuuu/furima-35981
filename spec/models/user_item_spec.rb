require 'rails_helper'

RSpec.describe UserItem, type: :model do
  before do
    @item_user = FactoryBot.build(:item_user)
  end

  context '内容に問題ない場合' do
  end

  context '内容に問がある場合' do
    it "user,item" do
    end
  end
end
