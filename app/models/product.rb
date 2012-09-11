# == Schema Information
#
# Table name: products
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  description :text
#  stock       :integer
#  limit       :integer
#

class Product < ActiveRecord::Base
  attr_accessible :amount, :name, :unit, :description, :stock, :limit
  has_many :cart_rows
  has_one :inquery
  has_many :periods

  validates :name, presence: true
  validates :description, presence: true
  validates :stock, presence: true, :numericality => true
  validates :limit, presence: true, :numericality => true
end
