# == Schema Information
#
# Table name: carts
#
#  id         :integer         not null, primary key
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Cart < ActiveRecord::Base
  has_many :cart_rows, dependent: :destroy
  has_many :product_requests
end
