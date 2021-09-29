require 'rails_helper'

RSpec.describe BuyersAddress, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyers_address = FactoryBot.build(:buyers_address, user_id: user.id, item_id: item.id)
      sleep(1)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@buyers_address).to be_valid
      end

      it 'building_nameが空でも保存できること' do
      @buyers_address.building_name = ''
      expect(@buyers_address).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'postal_codeが空だと保存できないこと' do
        # @donation_address.postal_code = ''
        # @donation_address.valid?
        # expect(@donation_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        
      end
      it 'area_idを選択していないと保存できないこと' do
        
      end
      it 'municipalitiesが空だと保存できないこと' do
        
      end
      it 'number_addressが空だと保存できないこと' do
        
      end
      it 'phone_numberが空だと保存できないこと' do
        
      end
      it 'phone_numberが１０桁以上１１桁以内の半角数値のみ保存可能なこと' do
        
      end
      it 'tokenが空だと保存できないこと' do
        
      end
    end
  end
end
