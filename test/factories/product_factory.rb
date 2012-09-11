FactoryGirl.define do

  factory :product do
    name 'Cholecap - 100mg'
    description "This is a description of the product..."
    limit 3
    stock 10
  end
end