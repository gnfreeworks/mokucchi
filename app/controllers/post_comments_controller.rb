class PostCommentsController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    @user_name = User.find(current_user.id).name
    @comment = @post.post_comments.build(comment_params)
    if @comment.save
      respond_to do |format|
        format.html
        format.json
      end 
    else
      flash.now[:alert] = 'コメントの投稿に失敗しました。'
    end

    # render :index
  end

  def destroy
    @comment = PostComment.find(params[:id])
    @comment.destroy
    render :index
  end

  private

  def comment_params
    params.permit(:comment, :post_id).merge(user_id: current_user.id)
  end

end