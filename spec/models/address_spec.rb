require 'rails_helper'

RSpec.describe Address, type: :model do
  describe '配送先入力' do
    before do
      @address = FactoryBot.build(:address)
    end

    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        binding.pry
        expect(@address).to be_valid
      end
    end
  end
end
