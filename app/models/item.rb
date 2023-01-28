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
    validates :image, :name, :description, :price

    with_options numericality: { other_than: 0, message: "can't be blank" } do
      validates :category_id, :condition_id, :shipping_fee_id, :prefecture_id, :shipping_day_id
    end

    with_options format: { with: /\A[0-9]+\z/ } do
      validates :price, numericality: { greater_than: 300, less_than: 9999999 }
    end
  end
end
