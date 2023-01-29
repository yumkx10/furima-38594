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

  with_options presence: true do
    validates :image, :name, :description

    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id
    end

    validates :price, numericality: { only_integer: true, greater_than: 299, less_than: 10000000, message: 'is out of setting range' }
  end
end
