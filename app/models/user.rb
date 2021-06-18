class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true, format: { with: /\A[ァ-ヴ\p]+\z/, message: '全角文字を使用してください' } do
    validates :kana_sei
    validates :kana_mei
  end

  validates :password, format: {with: /\A(?=.*?[a-z])(?=.*?[\d])(?=.*?[\d])[a-z\d]+\z/, message: "は、英数混合で入力してください"}
end
