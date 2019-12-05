FactoryBot.define do
  factory :user do
    nickname                {Faker::Name.first_name}
    email                   {Faker::Internet.free_email}
    password                {"abcd1234"}
    password_confirmation   {"abcd1234"}
  end
end