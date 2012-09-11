# == Schema Information
#
# Table name: users
#
#  id                     :integer         not null, primary key
#  email                  :string(255)     default(""), not null
#  encrypted_password     :string(255)     default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer         default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime        not null
#  updated_at             :datetime        not null
#  admin                  :boolean         default(FALSE)
#  photo_file_name        :string(255)
#  photo_content_type     :string(255)
#  photo_file_size        :integer
#  photo_updated_at       :datetime
#  first_name             :string(255)
#  last_name              :string(255)
#  license_number         :string(255)
#  state                  :string(255)
#  specialty              :string(255)
#

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :photo,
                  :first_name, :last_name, :license_number, :state, :specialty, :created_at

  has_many :period_registrations
  has_many :inqueries
  has_many :product_requests

  STATES = ['Alabama', 'Alaska', 'Arizona', 'Arkansas', 'California', 'Colorado', 
    'Connecticut', 'Delaware', 'Florida', 'Georgia', 'Hawaii', 'Idaho', 'Illinois', 'Indiana', 
    'Iowa', 'Kansas', 'Kentucky', 'Louisiana', 'Maine', 'Maryland', 'Massachusetts', 'Michigan', 'Minnesota', 
    'Mississippi', 'Missouri', 'Montana', 'Nebraska', 'Nevada', 'New Hampshire', 'New Jersey', 'New Mexico', 
    'New York', 'North Carolina', 'North Dakota', 'Ohio', 'Oklahoma', 'Oregon', 'Pennsylvania', 'Rhode Island', 'South Carolina', 
    'South Dakota', 'Tennessee', 'Texas', 'Utah', 'Vermont', 'Virginia', 'Washington', 'West Virginia', 'Wisconsin', 'Wyoming']

  SPECIALTY = ['Allergy and Immunology', 'Anaesthetics','Pathology','Cardiology',
    'Paediatric Cardiology','Cardiothoracic Surgery','Clinical Neurophysiology',
    'Dermato-Venereology','Endocrinology','Gastroenterology','Geriatrics','Gynaecology and Obstetrics',
    'Health Informatics','Infectious Diseases','Internal Medicine','Interventional Radiology',
    'Vascular','Microbiology','Nephrology','Neurology','Neurosurgery']

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :license_number, presence: true
  validates :license_number, uniqueness: true
  validates :state, :inclusion => { :in => STATES, :message => "%{value} is not a valid state" }
  validates :specialty, :inclusion => { :in => SPECIALTY, :message => "%{value} is not a valid specialty" }

   has_attached_file :photo,
    :storage => :s3,
    :s3_credentials => "#{Rails.root}/config/s3.yml",
    :styles => { :medium => "300x300>", :thumb => "100x100>", small: "150x150", mini: "25x25"}

  
end
