class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :shipping
  belongs_to :prefecture
  belongs_to :day


  has_one_attached :image

  validates :image,       presence: true
  validates :title,       presence: true
  validates :description, presence: true
  validates :category,    presence: true
  validates :condition,   presence: true
  validates :shipping,    presence: true
  validates :prefecture,  presence: true
  validates :day,         presence: true
  validates :price,       presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999, with: /\A[0-9]+\z/, message: "is invalid"}



end
