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

require 'test_helper'

class PeriodRegistrationTest < ActiveSupport::TestCase
 def setup

  @period_registration = FactoryGirl.create(:period_registration)
  end
  
  test "valid period_registration must be valid" do
    assert_respond_to @period_registration, :period_id
    assert_respond_to @period_registration, :user_id
    assert @period_registration.valid?
  end

end
