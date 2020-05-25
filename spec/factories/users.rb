FactoryBot.define do

  factory :user do
    name                  {"sample"}
    email                 {"sample@gmail.com"}
    password              {"00000000"}
    password_confirmation {"00000000"}
  end

end