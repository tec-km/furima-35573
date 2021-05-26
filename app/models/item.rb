class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :day

  belongs_to :user

  has_one_attached :image

  validates :image,         presence: true 
  validates :title,         presence: true
  validates :description,   presence: true
  validates :category_id,   numericality: { other_than: 1 } 
  validates :condition_id,  numericality: { other_than: 1 } 
  validates :shipping_id,   numericality: { other_than: 1 }
  validates :prefecture_id, numericality: { other_than: 1 }
  validates :day_id,        numericality: { other_than: 1 }
  validates :price,         presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, with: /\A[0-9]+\z/, message: "is invalid"}



end
