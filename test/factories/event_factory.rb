FactoryGirl.define do

  factory :event do
    name 'First Event'
    street '123 street'
    city 'Chicago'
    state 'Iowa'
    date Date.today
  end
end