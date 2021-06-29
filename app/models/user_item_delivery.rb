class UserItemDelivery
  include ActiveModel::Model
  attr_accessor :token, :zip_code, :shipping_area_id, :municipalities, :address, :building, :tel, :user_id, :item_id

  with_options presence: true do
    validates :zip_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/,message: "is invalid. Include hyphen(-)"}
    validates :shipping_area_id, numericality: { other_than: 1 }
    validates :municipalities, :address, :token, :user_id, :item_id
    validates :tel, numericality: {only_integer: true}, format: { with: /\A\d{10,11}\z/}
  end


  def save
    user_item = UserItem.create(user_id: user_id, item_id: item_id)
    Delivery.create(zip_code: zip_code, shipping_area_id: shipping_area_id, municipalities: municipalities, address: address, building: building, tel: tel, user_item_id: user_item.id)
  end
end