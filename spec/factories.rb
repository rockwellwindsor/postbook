FactoryGirl.define do
  factory :user do
    sequence(:first_name)  {|n| "Person"}
    sequence(:last_name) {|n| "#{n}"}
    sequence(:email) {|n| "person_#{n}@example.com"}
    password "password"
    password_confirmation "password"
    encrypted_password User.new.send(:password_digest, 'password')
  end

  factory :post do
    title "Super awesome test post"
    body "Lorem ipsum dolor et..."
    user
  end

  factory :comment do
    body "Lorem ipsum dolor et..."
    user
    post
  end
end