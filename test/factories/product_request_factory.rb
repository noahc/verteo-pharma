FactoryGirl.define do

  factory :product_request do
    cart
    user
    product
    quantity 1
    street '123 street'
    city 'Some City'
    state 'Iowa'
    zip '13829'
  end
end