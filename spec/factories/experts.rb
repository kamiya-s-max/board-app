FactoryBot.define do
  factory :expert do
    name {Faker::Job.key_skill}
    text {Faker::Lorem.sentence}
    career {"1~2年"}
    contact {Faker::Internet.free_email}
    user
    category
  end
end