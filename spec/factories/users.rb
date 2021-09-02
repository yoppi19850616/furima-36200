FactoryBot.define do
  factory :user do
    nickname              { 'test' }
    email                 { Faker::Internet.free_email }
    password              { 'aa0000' }
    password_confirmation { 'aa0000' }
    last_name             { '山田' }
    first_name            { '太郎' }
    last_name_furigana    { 'ヤマダ' }
    first_name_furigana   { 'タロウ' }
    birthday              { '1985-06-16' }
  end
end
