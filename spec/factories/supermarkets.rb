FactoryBot.define do
  factory :supermarket do
    market      {'KOマート'}
    market_url  {'https://ppp.ooo'}
    detail      {'お肉とお魚はここで買う！'}

    association :user
  end
end
