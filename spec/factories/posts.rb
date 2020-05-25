FactoryBot.define do

  factory :post do
    title                 {"TESTもくもく会"}
    access_url            {"http://www.zoom.com"}
    description           {"これはもくもく会のテスト投稿です。"}

    association :user
  end

end