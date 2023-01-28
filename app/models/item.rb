class Item < ApplicationRecord
  belongs_to :user
  has_one :order

  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :shipping_fee
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :shipping_day

  with_options presence :true do
    validates :image, :name, :description  presence: true

    with_options numericality: { other_than: 1 } do
      validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id
    end
end
