FactoryGirl.define do

  factory :period do
    name 'First Period'
    description 'This is a description'
    start_time Time.now + 10.days
    end_time Time.now + 10.days + 2.hours
    event
    product
  end
end