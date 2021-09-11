FactoryBot.define do
  factory :item do
    title              { '商品名' }
    description        { '商品説明' }
    category_id        { 2 }
    status_id          { 2 }
    shipping_charge_id { 2 }
    area_id            { 2 }
    send_date_id       { 2 }
    price              { 5000 }

    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
