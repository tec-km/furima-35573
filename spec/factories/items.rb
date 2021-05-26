FactoryBot.define do
  factory :item do
    title         {"商品のタイトルです。"}
    description   {"商品の説明です。"}
    category_id   {1}
    condition_id  {1}
    shipping_id   {1}
    prefecture_id {1}
    day_id        {1}
    price         {10000}

    
    association :user 

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end


  end
end
