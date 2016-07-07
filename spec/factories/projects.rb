FactoryGirl.define do
  factory :project do
    sequence(:title) {|n| "#{Faker::Commerce.project_name}-#{n}" }
    description             { Faker::Lorem.paragraph         }
    due_date             60.days.from_now

  end
end
