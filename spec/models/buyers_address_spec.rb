require 'rails_helper'

RSpec.describe BuyersAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyers_address = FactoryBot.build(:buyers_address, user_id: user.id, item_id: item.id)
      sleep(1)  # Macの処理によりエラーが発生するため、処理スピードを低下させております。
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyers_address).to be_valid
      end
      it 'building_nameが空でも保存できること' do
        @buyers_address.building_name = ''
        expect(@buyers_address).to be_valid
      end
      it 'phone_numberが10桁でも保存できること' do
        @buyers_address.phone_number = '0000000000'
        expect(@buyers_address).to be_valid
      end
      it 'phone_numberが11桁でも保存できること' do
        @buyers_address.phone_number = '00000000000'
        expect(@buyers_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        @buyers_address.postal_code = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @buyers_address.postal_code = '1234567'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'area_idを選択していないと保存できないこと' do
        @buyers_address.area_id = 1
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Area can't be blank")
      end
      it 'municipalitiesが空だと保存できないこと' do
        @buyers_address.municipalities = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'number_addressが空だと保存できないこと' do
        @buyers_address.number_address = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Number address can't be blank")
      end
      it 'phone_numberが空だと保存できないこと' do
        @buyers_address.phone_number = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが12桁以上だと保存できないこと' do
        @buyers_address.phone_number = '000000000000'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが9桁以下だと保存できないこと' do
        @buyers_address.phone_number = '000000000'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberに半角数字以外が含まれている場合だと保存できないこと' do
        @buyers_address.phone_number = '0901234567８'
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと保存できないこと' do
        @buyers_address.token = ''
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'userが紐づいていなければ出品できない' do
        @buyers_address.user_id = nil
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐づいていなければ出品できない' do
        @buyers_address.item_id = nil
        @buyers_address.valid?
        expect(@buyers_address.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
