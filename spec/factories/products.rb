FactoryGirl.define do
  factory :product do
    title { FFaker::Product.product_name }
    price { rand() * 100 }
    published false
    description { FFaker::Product.product_description }
    user_id "1"
  end
end
