FactoryGirl.define do
  factory :product do
    title { FFaker::Product.product_name }
    price { rand() * 100 }
    quantity 87
    published false
    description "This thing is great!"
    user
  end
end
