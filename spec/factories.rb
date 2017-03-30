FactoryGirl.define do
  factory :user do
    id 3334
    sequence(:first_name)  {|n| "Person"}
    sequence(:last_name) {|n| "#{n}"}
    sequence(:email) {|n| "person_#{n}@example.com"}
    password "password"
    password_confirmation "password"
  end

  factory :post do
    title "Super awesome test post"
    body "Lorem ipsum dolor et..."
    user
  end
end