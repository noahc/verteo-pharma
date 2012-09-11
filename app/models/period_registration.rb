# == Schema Information
#
# Table name: period_registrations
#
#  id         :integer         not null, primary key
#  period_id  :integer
#  user_id    :integer
#  created_at :datetime        not null
#  updated_at :datetime        not null
#

class PeriodRegistration < ActiveRecord::Base
  attr_accessible :period_id, :user_id
  belongs_to :period
  belongs_to :user
end
