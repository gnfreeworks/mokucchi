FactoryBot.define do

  factory :post_comment do
    comment               {"コメントテスト投稿です!!"}

    association :user
    association :post
  end

end