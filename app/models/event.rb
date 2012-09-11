# == Schema Information
#
# Table name: events
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  date       :date
#  street     :string(255)
#  city       :string(255)
#  state      :string(255)
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class Event < ActiveRecord::Base
  attr_accessible :city, :date, :name, :state, :street
  has_many :periods, dependent: :destroy

  validates :name, presence: true
  validates :street, presence: true
  validates :city, presence: true
  validates :state, presence: true
  validates_date :date
end
