require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報' do
    context '新規登録できるとき' do
      it '全ての情報が正確に存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが英数字混在であれば登録できる' do
        @user.password = '1aaaaa'
        @user.password_confirmation = @user.password
        expect(@user).to be_valid
      end
      it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
        @user.password = 'a000000'
        @user.password_confirmation = 'a000000'
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
        expect(another_user.errors.full_messages).to include"Email has already been taken"
      end
      it 'emailに＠が含まれていないと登録できない' do
        @user.email = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include"Email is invalid"
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = 'a0000'
        @user.password_confirmation = 'a0000'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password is too short (minimum is 6 characters)"
      end
      it 'passwordは、数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password is invalid"
      end
      it 'passwordは、半角英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password is invalid"
      end
      it 'passwordとpassword_confirmationが一致していないと登録できない' do
        @user.password = 'a00000'
        @user.password_confirmation = 'b00000'
        @user.valid?
        expect(@user.errors.full_messages).to include"Password confirmation doesn't match Password"
      end
    end
  end
  describe '新規登録/本人情報確認' do
    context '新規登録できるとき' do
      it 'kana_sei,kana_meiは、全角カタカナであれば登録できる' do
        @user.kana_sei = 'タナカ'
        @user.kana_mei = 'タロウ'
        expect(@user).to be_valid
      end
    end

    context '新規登録できないとき' do
      it 'seiが空では登録できない' do
        @user.sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include"Sei can't be blank"
      end
      it 'meiが空では登録できない' do
        @user.mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include"Mei can't be blank"
      end
      it 'seiは半角では登録できない' do
        @user.sei = 'ﾀﾅｶ'
        @user.valid?
        expect(@user.errors.full_messages).to include"Sei is invalid"
      end
      it 'meiは半角では登録できない' do
        @user.mei = 'ﾊﾅｺ'
        @user.valid?
        expect(@user.errors.full_messages).to include"Mei is invalid"
      end
      it 'kana_seiが空では登録できない' do
        @user.kana_sei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include"Kana sei can't be blank"
      end
      it 'kana_meiが空では登録できない' do
        @user.kana_mei = ''
        @user.valid?
        expect(@user.errors.full_messages).to include"Kana mei can't be blank"
      end
      it 'kana_sei,kana_meiはひらがなでは登録できない' do
        @user.kana_mei = 'たなか'
        @user.valid?
        expect(@user.errors.full_messages).to include"Kana mei is invalid"
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include"Birthday can't be blank"
      end
    end
  end
end
