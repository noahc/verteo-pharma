# == Schema Information
#
# Table name: product_requests
#
#  id         :integer         not null, primary key
#  product_id :integer
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#  quantity   :integer
#  street     :string(255)
#  city       :string(255)
#  state      :string(255)
#  zip        :string(255)
#  status     :string(255)
#

class ProductRequest < ActiveRecord::Base
  attr_accessible :product_id, :user_id, :quantity, :street, :city, :state, :zip, :status, :cart_id
  belongs_to :product
  belongs_to :user
  belongs_to :cart

  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates_format_of :zip, :with => /^\d{5}(-\d{4})?$/, :message => "should be in the form 12345 or 12345-1234"
  validates :product_id, :numericality => true
  validates :user_id, :numericality => true

  STATUS = ['New', 'Processing', 'Shipped']
end
