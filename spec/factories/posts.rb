FactoryGirl.define do
  factory :post do
    title '7 reasons why Ruby is the best language!'
    description '18 reasons why the N number of reasons articles suck!'

    trait :trending do
      trending_at { Time.current }
    end
  end
end
