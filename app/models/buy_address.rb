class BuyAddress
  include ActiveModel::Model
  attr_accessor :postal, :prefecture_id, :municipalities, :address, :buildingname, :phone, :buy, :item, :user_id

  with_options presence: true do
    validates :postal
    validates :prefecture_id
    validates :municipalities
    validates :address
    validates :phone
    validates :item
    validates :user_id
  end
  
  validates :postal, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
  validates :phone, length: { maximum: 11 }

  def save
  buy = Buy.create(item: item, user_id: user_id)
  Address.create(postal: postal, prefecture_id: prefecture_id, municipalities: municipalities, address: address, buildingname: buildingname, phone: phone, buy: buy.id)

  end
  
end



end




end