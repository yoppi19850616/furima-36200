class BuyersAdress
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :postal_code, :prefectures, :municipalities, :number_address, :building_name, :phone_number

  def save
    buyers = Buyers.create(user_id: user_id, item_id: item_id)
    Address.create(postal_code: postal_code, prefectures: prefectures, municipalities: municipalities, number_address: number_address, building_name: building_name, phone_number: phone_number)
  end
  