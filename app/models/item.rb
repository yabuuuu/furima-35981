class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_area
  belongs_to :shipping_burden
  belongs_to :shipping_date


  
  validates :name, :description, presence: true
  validates :category_id, :condition_id, :shipping_area_id, :shipping_burden_id, :shipping_date_id, numericality: { other_than: 1 } 
end
