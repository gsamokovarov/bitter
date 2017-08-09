FactoryGirl.define do
  factory :user do
    email 'gsamokovarov@gmail.com'
    password 'test1234'

    after :create do |record|
      Credentials.create!(password: record.password, authorizable: record)
    end
  end
end
