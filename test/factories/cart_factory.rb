FactoryGirl.define do
  factory :cart do
    factory :cart_with_1_row do
      after(:create) do |cart|
        FactoryGirl.create(:cart_row, cart: cart)
        FactoryGirl.create(:product_request, cart: cart)
      end
    end
  end
end