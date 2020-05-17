class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  belongs_to_active_hash :prefecture
  belongs_to_active_hash :condition
  belongs_to_active_hash :deliveryfee
  belongs_to_active_hash :daysuntilshipping

  belongs_to :category

  has_many :images, dependent: :destroy
  accepts_nested_attributes_for :images, allow_destroy: true

  validates :name, :explanation, :category, :condition_id, :delivery_fee_id, :prefecture_id, :days_until_shipping_id, :price, presence: true
  validates :price, numericality: { only_integer: true , greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999 }
  validates :images, presence: true
end
