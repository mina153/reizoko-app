FactoryBot.define do
  factory :want do
    wanted         {'カレーライスの素'}
    categori_id    {2}
    account        {'12345678901234567890'}

    association :user
    association :supermarket
  end
end
