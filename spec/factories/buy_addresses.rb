FactoryBot.define do
  factory :buy_address do
      postal           {"123-4567"}
      prefecture_id    {2}
      municipalities   {"東京都"}
      address          {"1-1-1"}
      buildingname     {"東京ビル"}
      phone            {"10000000000"}              
      token {"tok_abcdefghijk00000000000000000"}
    end
end
