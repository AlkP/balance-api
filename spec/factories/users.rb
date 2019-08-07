FactoryGirl.define do
  sequence :name do |n|
    "user name #{n}"
  end

  factory :user do
    name
  end
end
