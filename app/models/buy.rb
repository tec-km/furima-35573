class Buy < ApplicationRecord
  belongs_to :user
  has_one :address
end
