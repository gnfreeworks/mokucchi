require 'rails_helper'

describe PostComment do

  describe '#create' do
    let(:post) { create(:post, user: create(:user)) }

    it "commentが存在すれば登録できること" do
      post_comment = build(:post_comment, post: post)
      expect(post_comment).to be_valid
    end

    it "commentがない場合は登録できないこと" do  
      post_comment = build(:post_comment, comment: "", post: post)
      post_comment.valid?
      expect(post_comment.errors[:comment]).to include("を入力してください")
    end
  end

end