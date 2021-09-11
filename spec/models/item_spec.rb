require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '出品登録' do
    context '出品できるとき' do
      it 'title,description,category_id,status_id,shipping_charge_id,area_id,
          send_date_id,price,imageが存在すれば登録できる' do
      end
    end
    context '出品できないとき' do
      it 'titleが空では登録できない' do
      end
      it 'descriptionが空では登録できない' do
      end
      it 'category_idが---では登録できない' do
      end
      it 'status_idが---では登録できない' do
      end
      it 'shipping_charge_idが---では登録できない' do
      end
      it 'area_idが---では登録できない' do
      end
      it 'send_date_idが---では登録できない' do
      end
      it 'priceが空では登録できない' do
      end
      it 'priceが9,999,999を超えていては登録できない' do
      end
      it 'priceが300未満では登録できない' do
      end
      it 'imageが空では登録できない' do
      end
    end
  end
end
