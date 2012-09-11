# == Schema Information
#
# Table name: cart_rows
#
#  id         :integer         not null, primary key
#  product_id :integer
#  cart_id    :integer
#  quantity   :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class CartRow < ActiveRecord::Base
  attr_accessible :cart_id, :product_id, :quantity
  belongs_to :cart
  belongs_to :product

  validates :product_id, presence: true, :numericality => true
  validates :cart_id, presence: true, :numericality => true
  validates :quantity, presence: true, :numericality => true
  validate :quantity, :more_than_stock,  :message => "more than in stock is reserved." 
  validate :quantity, :more_than_limit,  :message => "more than our single customer limit" 

  def add_product(product_id, current_cart)
    current_row = CartRow.where(cart_id: current_cart.id, product_id: product_id).first
    if current_row
        current_row.quantity += 1
    else
      current_row = CartRow.new(product_id: product_id, cart_id: current_cart.id, quantity: 1)
    end
    current_row.save
  end

  def more_than_stock
    errors.add(:quantity, "should be less than in stock") if self.quantity > self.product.stock
  end

  def more_than_limit
     errors.add(:quantity, "should be less than single customer limit") if self.quantity > self.product.limit
  end
end
