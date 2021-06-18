require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録できるとき' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる' do
       
      end
      it 'passwordが英数字混在であれば登録できる' do
        @user.nickname = 'aaaaaa'
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include"Nickname can't be blank"
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include"Email can't be blank"
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠が含まれていないと登録できない' do
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = '00000'
        @user.password_confirmation = '00000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは、数字のみでは登録できない' do
      end
      it 'passwordは、半角英字のみでは登録できない' do
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        
      end
    end
  end
  describe '新規登録/本人情報確認' do
    context '新規登録できるとき' do
      it 'sei,mei,kana_sei,kana_mei,birthdayが存在すれば登録できる' do
       
      end
      it 'kana_sei,kana_meiは、全角カタカナであれば登録できる' do
        
      end
    end

    context '新規登録できないとき' do
      it 'sei,mei,が空では登録できない' do

      end
      it 'sei,mei,は半角では登録できない' do
      end
      it 'kana_sei,kana_meiが空では登録できない' do
      end
      it 'kana_sei,kana_meiはひらがなでは登録できない' do
      end
      it 'birthdayが空では登録できない' do
      end
    end
  end
end
