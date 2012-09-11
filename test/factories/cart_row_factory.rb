FactoryGirl.define do

  factory :cart_row do
    product
    cart
    quantity 3
  end
end