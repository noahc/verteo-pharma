# == Schema Information
#
# Table name: inqueries
#
#  id              :integer         not null, primary key
#  product_id      :string(255)
#  description     :text
#  created_at      :datetime        not null
#  updated_at      :datetime        not null
#  phone           :string(255)
#  street          :string(255)
#  state           :string(255)
#  city            :string(255)
#  zip             :string(255)
#  user_id         :integer
#  perfered_method :string(255)
#

class Inquery < ActiveRecord::Base
  attr_accessible :message, :phone, :zip, :product_id, :state, 
                  :street, :city, :user_id, :perfered_method
  belongs_to :product
  belongs_to :user

  METHODS = ['Phone', 'Postal Address', 'Email']

  STATES = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 
  'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 
  'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 
  'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 
  'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 
  'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']
    
  validates :message, presence: true
  validates_presence_of :phone, if: :by_phone?
  validates_presence_of :street, if: :by_post?
  validates_presence_of :state, if: :by_post?
  validates_presence_of :city, if: :by_post?
  validates_presence_of :zip, :inclusion => 10000..99999, if: :by_post?
  validates :user_id, presence: true
  validates :perfered_method, presence: true


  def by_phone?
    perfered_method == 'Phone'
  end

  def by_post?
    perfered_method == 'Postal Address'
  end

  def by_email?
    perfered_method == 'Email'
  end
end
