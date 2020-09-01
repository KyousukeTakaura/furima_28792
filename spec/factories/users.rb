FactoryBot.define do
  factory :user do
    nickname              {"子ab"}   #factorybotの{}の値に関しては基本的にはどのような値でも構わないが、例えばemailならemailの性質を反映した記述（"kkk@gmail.com"   等）にしなければならない。
    email                 {"kkk@gmail.com"}       #nicknameに関しても漢字、英語の両方を入れることができるなら例えば{"子ab"}  のように記述する。
    password              {"t000000"}
    password_confirmation {password}
    first_name  {"司"}
    family_name {"道明寺"}
    family_name_kana {"ドウミョウジ"}
    first_name_kana {"ツカサ"}
    birth_day {"1995-05-12"}  
  end
end