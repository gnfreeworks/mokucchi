# ユーザー情報登録
User.create(name: 'Sampleさん', email: "sample@gmail.com", password: "password", password_confirmation: "password")
User.create(name: 'Sample1さん', email: "sample1@gmail.com", password: "password", password_confirmation: "password")
User.create(name: 'Sample2さん', email: "sample2@gmail.com", password: "password", password_confirmation: "password")
User.create(name: 'Sample3さん', email: "sample3@gmail.com", password: "password", password_confirmation: "password")
User.create(name: 'Sample4さん', email: "sample4@gmail.com", password: "password", password_confirmation: "password")
User.create(name: 'Sample5さん', email: "sample5@gmail.com", password: "password", password_confirmation: "password")

# もくもく会投稿
Post.create(title: "☆朝活オンラインもくもく会☆", description: "誰でも参加可能なオンラインもくもく会です。メンバーは５人まで募集しています！", access_url: "http://www.google.com", user_id: 1)
Post.create(title: "Railsチュートリアルもくもく会", description: "誰でも参加可能なオンラインもくもく会です。メンバーは５人まで募集しています！", access_url: "http://www.google.com", user_id: 2)
Post.create(title: "一緒にもくもく会しませんか？", description: "誰でも参加可能なオンラインもくもく会です。メンバーは５人まで募集しています！", access_url: "http://www.google.com", user_id: 3)
Post.create(title: "オンラインもくもく会@夕方から", description: "誰でも参加可能なオンラインもくもく会です。メンバーは５人まで募集しています！", access_url: "http://www.google.com", user_id: 4)
Post.create(title: "いつでもどうぞ＠24時間オンライン", description: "誰でも参加可能なオンラインもくもく会です。メンバーは５人まで募集しています！", access_url: "http://www.google.com", user_id: 5)
Post.create(title: "自宅待機組もくもく会", description: "誰でも参加可能なオンラインもくもく会です。メンバーは５人まで募集しています！", access_url: "http://www.google.com", user_id: 6)

# もくもく会投稿へのコメント
# PostComment.create(comment:"コメントです", user_id: 1, post_id: 1)
# PostComment.create(comment:"コメントです①", user_id: 2, post_id: 2)
# PostComment.create(comment:"コメントです②", user_id: 3, post_id: 3)
# PostComment.create(comment:"コメントです③", user_id: 4, post_id: 4)
# PostComment.create(comment:"コメントです④", user_id: 5, post_id: 5)
# PostComment.create(comment:"コメントです⑤", user_id: 6, post_id: 6)
