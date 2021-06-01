class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :day

  belongs_to :user

  has_one    :buy

  has_one_attached :image

  with_options presence: true do
   validates :image 
   validates :title
   validates :description
  end

  with_options numericality: { other_than: 1 } do
   validates :category_id
   validates :condition_id 
   validates :shipping_id
   validates :prefecture_id
   validates :day_id
  end

   validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, with: /\A[0-9]+\z/, message: "is invalid"}
 


end
