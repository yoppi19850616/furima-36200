class BuyersAddress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :area_id, :municipalities, :number_address, :building_name, :phone_number, :token

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code,     format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :area_id,         numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities,  format: { with: /\A[ぁ-んァ-ン一-龥]+\z/ }
    validates :number_address
    validates :phone_number,    format: { with: /\A[0-9]+\z/ }
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, area_id: area_id, municipalities: municipalities, number_address: number_address, building_name: building_name, phone_number: phone_number, buyer_id: buyer.id)
  end
end
