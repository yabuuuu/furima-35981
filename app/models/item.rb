class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_area
  belongs_to :shipping_burden
  belongs_to :shipping_date
  has_one_attached :image
  

  
  validates :name, :description, :image, presence: true
  validates :category_id, :condition_id, :shipping_area_id, :shipping_burden_id, :shipping_date_id, numericality: { other_than: 1 } 
  validates :price, format: { with: /\A[0-9]+\z/ }, numericality: { in: 300..9999999 }

  def tax_price
    puts {price.to_i * 0.1}
  end
end
