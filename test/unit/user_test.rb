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

require 'test_helper'

class UserTest < ActiveSupport::TestCase
 def setup

  @user = FactoryGirl.create(:user)
  end

  test "first name must not be blank" do
    @user.first_name = "         "
    assert !@user.valid?
  end

  test "first name must not be nil" do
    @user.first_name = nil
    assert !@user.valid?
  end


  test "last name must not be blank" do
    @user.last_name = "         "
    assert !@user.valid?
  end

  test "last name must not be nil" do
    @user.last_name = nil
    assert !@user.valid?
  end

   test "license_number must not be blank" do
    @user.license_number = "         "
    assert !@user.valid?
  end

  test "license_number must not be nil" do
    @user.license_number = nil
    assert !@user.valid?
  end

  test 'state should be set correctly' do
    bad_state = FactoryGirl.build(:user, state: "not_a_state")
     assert !bad_state.valid?
  end

  test 'specialty should be set correctly' do
    bad_specialty = FactoryGirl.build(:user, specialty: "not_a_specialty")
     assert !bad_specialty.valid?
  end

end
