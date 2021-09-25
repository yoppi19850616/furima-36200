class BuyersAdress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures, :municipalities, :number_address, :building_name, :phone_number

  with_options presence: true do
    validates :user_id
    validates :item_id
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    
  end
  def save
    buyers = Buyers.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures: prefectures, municipalities: municipalities, number_address: number_address, building_name: building_name, phone_number: phone_number)
  end
