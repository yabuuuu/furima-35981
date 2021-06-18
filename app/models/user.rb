class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  

  with_options presence: true, format: { with: /\A[ァ-ヴ\p]+\z/ } do
    validates :kana_sei
    validates :kana_mei
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ } do
    validates :sei
    validates :mei
  end
  #validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: "は、英数混合で入力してください"}
  validates :password, format: {with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-z\d]+\z/i }
  
  validates :nickname, presence: true
  validates :birthday, presence: true  
end
