FactoryGirl.define do

  factory :inquery do
    product
    user
    message 'I have a question about....'
    phone 1938203829
    city 'Some Town'
    street '123 street'
    state 'Iowa'
    zip '28392'
    perfered_method 'Phone'

  end
end