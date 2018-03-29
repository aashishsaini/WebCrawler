FactoryGirl.define do
  factory :page do
    id ''
    url { Faker::Internet.url }
    content {
      {
        h1:  Array.new(rand(1 .. 7)) { Faker::Lorem.sentence },
        h2:  Array.new(rand(1 .. 8)) { Faker::Lorem.sentence },
        h3:  Array.new(rand(1 .. 6)) { Faker::Lorem.sentence },
        a:  Array.new(rand(1 ..9))  { Faker::Internet.url }
      }
    }
  end
end
