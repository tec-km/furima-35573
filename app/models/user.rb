class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

 with_options presence: true do
  validates :nickname
  validates :lastname
  validates :firstname
  validates :lastkana
  validates :firstkana
  validates :birthday
end

with_options format: {with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/} do
  validates :lastname
  validates :firstname 
end

with_options format: {with: /\A[ァ-ヶー]+\z/, message: "is invalid. Input full-width katakana characters."} do
  validates :lastkana
  validates :firstkana 
end
 
PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
validates_format_of :password, with: PASSWORD_REGEX 

end
