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

require 'test_helper'

class EventTest < ActiveSupport::TestCase
 
 def setup

  @event = FactoryGirl.create(:event)
  end

  test "valid event must be valid" do
    assert_respond_to @event, :name
    assert_respond_to @event, :date
    assert_respond_to @event, :city
    assert_respond_to @event, :street
    assert_respond_to @event, :state
    assert @event.valid?
  end
end
