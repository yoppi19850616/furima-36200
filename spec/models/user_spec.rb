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
      user = User.new(nickname: '', email: 'test@example', password: 'aa0000', password_confirmation: 'aa0000', last_name: '山田', first_name: '太郎', last_name_furigana: 'ヤマダ', first_name_furigana: 'タロウ', birthday: '1985-06-16')
      user.valid?
      expect(user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      user = User.new(nickname: 'test', email: '', password: 'aa0000', password_confirmation: 'aa0000', last_name: '山田', first_name: '太郎', last_name_furigana: 'ヤマダ', first_name_furigana: 'タロウ', birthday: '1985-06-16')
      user.valid?
      expect(user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '', password_confirmation: 'aa0000', last_name: '山田', first_name: '太郎', last_name_furigana: 'ヤマダ', first_name_furigana: 'タロウ', birthday: '1985-06-16')
      user.valid?
      expect(user.errors.full_messages).to include("Password can't be blank")
    end
    it 'last_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'aa0000', password_confirmation: 'aa0000', last_name: '', first_name: '太郎', last_name_furigana: 'ヤマダ', first_name_furigana: 'タロウ', birthday: '1985-06-16')
      user.valid?
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_nameが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'aa0000', password_confirmation: 'aa0000', last_name: '山田', first_name: '', last_name_furigana: 'ヤマダ', first_name_furigana: 'タロウ', birthday: '1985-06-16')
      user.valid?
      expect(user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_name_furiganaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'aa0000', password_confirmation: 'aa0000', last_name: '山田', first_name: '太郎', last_name_furigana: '', first_name_furigana: 'タロウ', birthday: '1985-06-16')
      user.valid?
      expect(user.errors.full_messages).to include("Last name furigana can't be blank")
    end
    it 'first_name_furiganaが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'aa0000', password_confirmation: 'aa0000', last_name: '山田', first_name: '太郎', last_name_furigana: 'ヤマダ', first_name_furigana: '', birthday: '1985-06-16')
      user.valid?
      expect(user.errors.full_messages).to include("First name furigana can't be blank")
    end
    it 'birthdayが空では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'aa0000', password_confirmation: 'aa0000', last_name: '山田', first_name: '太郎', last_name_furigana: 'ヤマダ', first_name_furigana: 'タロウ', birthday: '')
      user.valid?
      expect(user.errors.full_messages).to include("Birthday can't be blank")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'aa0000', password_confirmation: 'bb0000', last_name: '山田', first_name: '太郎', last_name_furigana: 'ヤマダ', first_name_furigana: 'タロウ', birthday: '1985-06-16')
      user.valid?
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'passwordが5文字以下では登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: 'aa000', password_confirmation: 'aa0000', last_name: '山田', first_name: '太郎', last_name_furigana: 'ヤマダ', first_name_furigana: 'タロウ', birthday: '1985-06-16')
      user.valid?
      expect(user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'passwordが半角英数字混合で無ければ登録できない' do
      user = User.new(nickname: 'test', email: 'test@example', password: '000000', password_confirmation: 'aa0000', last_name: '山田', first_name: '太郎', last_name_furigana: 'ヤマダ', first_name_furigana: 'タロウ', birthday: '1985-06-16')
      user.valid?
      expect(user.errors.full_messages).to include("Password is invalid")
    end
    it '重複したemailが存在する場合登録できない' do
    end
    it 'emailに@が無ければ登録できない' do
      user = User.new(nickname: 'test', email: 'testexample', password: 'aa0000', password_confirmation: 'aa0000', last_name: '山田', first_name: '太郎', last_name_furigana: 'ヤマダ', first_name_furigana: 'タロウ', birthday: '1985-06-16')
      user.valid?
      expect(user.errors.full_messages).to include("Email is invalid")
    end
  end
end
