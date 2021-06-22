class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  

  with_options presence: true, format: { with: /\A[ァ-ヴー]+\z/ } do
    validates :kana_sei
    validates :kana_mei
  end

  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/ } do
    validates :sei
    validates :mei
  end
  
  validates :password, format: {with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])[a-z\d]+\z/i }
  
  validates :nickname, presence: true
  validates :birthday, presence: true  
end
