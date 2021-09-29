FactoryBot.define do
  factory :buyers_address do
    postal_code    { '123-4567' }
    area_id        { 2 }
    municipalities {'大阪市'}
    number_address { '1-1-1' }
    building_name  {'テストビル１号館'}
    phone_number   {'09012345678'}
  end
end
