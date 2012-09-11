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

require 'test_helper'

class PeriodTest < ActiveSupport::TestCase
  def setup
    @period = FactoryGirl.create(:period)
  end
  
  test "valid period must be valid" do
    assert_respond_to @period, :name
    assert_respond_to @period, :event_id
    assert_respond_to @period, :start_time
    assert_respond_to @period, :end_time
    assert_respond_to @period, :description
    assert @period.valid?
  end

  test "name must be present" do
    @period.name = nil
    assert !@period.valid?
  end

  test "start_time must be present" do
    @period.start_time = nil
    assert !@period.valid?
  end

  test "start_time must be a date" do
    @period.start_time = 12
    assert !@period.valid?
  end

  test "end_time must be present" do
    @period.end_time = nil
    assert !@period.valid?
  end

  test "end_time must be a date" do
    @period.end_time = 12
    assert !@period.valid?
  end

  test "description must be present" do
    @period.description = nil
    assert !@period.valid?
  end
end
