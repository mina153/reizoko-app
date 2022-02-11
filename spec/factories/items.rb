FactoryBot.define do
  factory :item do
    thing         {'tomato'}
    category_id   {2}
    expiry        {2023-11-11}
    explanation   {'完熟トマト、早く食べるべし'}

    association :user
  end
end
