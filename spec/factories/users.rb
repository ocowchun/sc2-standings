FactoryBot.define do
  factory :user do
    sequence(:email) {|n| "email-#{n}@test.com"}
    password { 'p@ssw0rd' }
    confirmed_at { Time.now }
  end
end
