FactoryBot.define do
  factory :user do
    nickname              {Faker::Name.name}
    email                 {Faker::Internet.free_email}
    password              {"1a" + Faker::Internet.password(min_length: 6)}
    password_confirmation {password}
    lastname              {"佐藤"}
    firstname             {"太郎"}
    lastkana              {"サトウ"}
    firstkana             {"タロウ"}
    birthday              {Faker::Date.birthday}


  end
end

