require 'rails_helper'

RSpec.describe User, type: :model do
  # pending "add some examples to (or delete) #{__FILE__}"
  describe 'ユーザー新規登録' do
    it 'nicknameとemail、passwordとpassword_confirmation、last_nameとfirst_name、
        last_name_furiganaとfirst_name_furigana、birthdayが存在すれば登録できる' do
    end
    it 'emailが@を含んでいれば登録できる' do
    end
    it 'passwordとpassword_confirmationが6文字以上であれば登録できる' do
    end
    it 'passwordが半角英数字混合であれば登録できる' do
    end
    it 'nicknameが空では登録できない' do
    end
    it 'emailが空では登録できない' do
    end
    it 'passwordが空では登録できない' do
    end
    it 'last_nameが空では登録できない' do
    end
    it 'first_nameが空では登録できない' do
    end
    it 'last_name_furiganaが空では登録できない' do
    end
    it 'first_name_furiganaが空では登録できない' do
    end
    it 'birthdayが空では登録できない' do
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
    end
    it 'passwordが5文字以下では登録できない' do
    end
    it 'passwordが半角英数字混合で無ければ登録できない' do
    end
    it '重複したemailが存在する場合登録できない' do
    end
    it 'emailに@が無ければ登録できない' do
    end
  end
end
