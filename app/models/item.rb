class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category

  belongs_to :user
  has_one_attached :image

  validates :title,              presence: true
  validates :description,        presence: true
  validates :category_id,        presence: true, numericality: {other_than: 1, message:"can't be blank" }
  validates :status_id,          presence: true
  validates :shipping_charge_id, presence: true
  validates :area_id,            presence: true
  validates :send_date_id,       presence: true
  validates :price,              presence: true
  validates :image,              presence: true


end
