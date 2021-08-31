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
      user = FactoryBot.build(:user)
      user.nickname = ''
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = FactoryBot.build(:user)
      user.email = ''
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'last_nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_furiganaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.last_name_furigana = ''
      user.valid?
      expect(user.errors.full_messages).to include("Last name furigana can't be blank")
    end
    it 'first_name_furiganaが空では登録できない' do
      user = FactoryBot.build(:user)
      user.first_name_furigana = ''
      user.valid?
      expect(user.errors.full_messages).to include("First name furigana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      user = FactoryBot.build(:user)
      user.birthday = ''
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      user = FactoryBot.build(:user)
      user.password_confirmation = ''
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      user = FactoryBot.build(:user)
      user.password = 'aa0000'
      user.password_confirmation = 'bb0000'
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下では登録できない' do
      user = FactoryBot.build(:user)
      user.password = 'aa000'
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが半角英数字混合で無ければ登録できない' do
      user = FactoryBot.build(:user)
      user.password = '000000'
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it '重複したemailが存在する場合登録できない' do
    end
    it 'emailに@が無ければ登録できない' do
      user = FactoryBot.build(:user)
      user.email = 'testexample'
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
  end
end
