class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :shipping_charge
  belongs_to :area

  belongs_to :user
  has_one_attached :image

  validates :title,              presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true, numericality: {other_than: 1, message:"can't be blank" }
  validates :status_id,          presence: true, numericality: {other_than: 1, message:"can't be blank" }
  validates :shipping_charge_id, presence: true, numericality: {other_than: 1, message:"can't be blank" }
  validates :area_id,            presence: true, numericality: {other_than: 1, message:"can't be blank" }
  validates :send_date_id,       presence: true, numericality: {other_than: 1, message:"can't be blank" }
  validates :price,              presence: true
  validates :image,              presence: true

end
