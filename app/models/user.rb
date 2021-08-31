class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :nickname,            presence: true
  validates :last_name,           presence: true
  validates :first_name,          presence: true
  validates :last_name_furigana,  presence: true
  validates :first_name_furigana, presence: true
  validates :birthday,            presence: true
  validates :password,            presence: true, length: { minimum: 6 }, format: { with: /(?=.*[a-zA-Z])(?=.*\d)[a-zA-Z\d]{6,}/ }
  validates :email, presence: true

  has_many :items
  has_many :buyers
end
