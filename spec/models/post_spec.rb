require 'rails_helper'

describe Post do

  describe '#create' do
    it "title,access_url,descriptionが存在すれば登録できること" do
      post = build(:post, user: create(:user))
      expect(post).to be_valid
    end
    
    it "titleがない場合は登録できないこと" do
      post = build(:post, title: "", user: create(:user))
      post.valid?
      expect(post.errors[:title]).to include("を入力してください")
    end

    it "access_urlがない場合は登録できないこと" do
      post = build(:post, access_url: "", user: create(:user))
      post.valid?
      expect(post.errors[:access_url]).to include("を入力してください")
    end

    it "descriptionがない場合は登録できないこと" do
      post = build(:post, description: "", user: create(:user))
      post.valid?
      expect(post.errors[:description]).to include("を入力してください")
    end

    it "重複したuser_idが存在する場合登録できないこと" do
      user = create(:user)
      post = create(:post, user: user)
      another_post = build(:post, user: user)
      another_post.valid?
      expect(another_post.errors[:user_id]).to include("はすでに存在します")
    end
  end

end