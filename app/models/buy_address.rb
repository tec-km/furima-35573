class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :municipalities, :address, :buildingname, :phone, :buy, :item_id, :user_id, :token

  with_options presence: true do
    validates :postal
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :phone
    validates :item_id
    validates :user_id
    validates :token
  end
  
  validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone, length: { maximum: 11 }
  validates :prefecture_id ,numericality: { other_than: 1 }
  
  
  def save
  buy = Buy.create(item_id: item_id, user_id: user_id)
  Address.create(postal: postal, prefecture_id: prefecture_id, municipalities: municipalities, address: address, buildingname: buildingname, phone: phone, buy_id: buy.id)

  end
  
end