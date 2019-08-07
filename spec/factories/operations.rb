FactoryGirl.define do
  sequence :price do |n|
    n
  end

  factory :operation do
    user
    price
  end
end
