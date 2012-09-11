# == Schema Information
#
# Table name: periods
#
#  id          :integer         not null, primary key
#  name        :string(255)
#  event_id    :integer
#  created_at  :datetime        not null
#  updated_at  :datetime        not null
#  start_time  :time
#  end_time    :time
#  description :text
#  product_id  :integer
#

class Period < ActiveRecord::Base
  attr_accessible :event_id, :name, :start_time, :end_time, :description, :product_id
  belongs_to :event
  belongs_to :product
  has_many :period_registrations, dependent: :destroy

  validates_time :end_time
  validates_time :start_time
  validates_presence_of :name
  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_presence_of :description
end
