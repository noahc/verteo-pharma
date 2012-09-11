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

require 'test_helper'

class InqueryTest < ActiveSupport::TestCase


def setup

  @inquery = FactoryGirl.create(:inquery)
  end
  
  test "valid inquery must be valid" do
    assert_respond_to @inquery, :message
    assert_respond_to @inquery, :city
    assert_respond_to @inquery, :street
    assert_respond_to @inquery, :state
    assert_respond_to @inquery, :phone
    assert_respond_to @inquery, :zip
    assert_respond_to @inquery, :product_id
    assert_respond_to @inquery, :user_id
    assert @inquery.valid?
  end

   test "invalid phone inquery must be invalid" do
    @inquery.perfered_method = "Phone"
    @inquery.phone = nil
    assert !@inquery.valid?
    end

    test "invalid address inquery must be invalid" do
      @inquery.perfered_method = "Postal Address"
    @inquery.street = nil
    assert !@inquery.valid?
    end
end
