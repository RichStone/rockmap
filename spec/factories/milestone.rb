FactoryBot.define do
  factory :milestone do
    name {'Create the first Banana'}
    description {'The banana should be in an abstract style, satisfying the customer'}
    liveline {Date.today + 30}
    roadmap
  end
end
