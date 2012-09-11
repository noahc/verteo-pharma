FactoryGirl.define do

  factory :user do
   first_name "John"
   last_name "Doe"
   sequence(:email) { |n| "example#{n}@example.com" }
   password "foobar"
   password_confirmation "foobar"
   sequence(:license_number) { |n| "1234#{n}" }
   state 'Iowa'
   specialty 'Neurosurgery'
  end

  

end