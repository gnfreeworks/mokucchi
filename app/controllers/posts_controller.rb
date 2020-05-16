class PostsController < ApplicationController
  def index
    @posts = Post.all.order(created_at: "DESC")
  end

  def new
    if Post.find_by(user_id: current_user.id)
      post = Post.find_by(user_id: current_user.id)
      redirect_to edit_post_path(post.id)
    else
      @post = Post.new
    end
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      redirect_to root_path, notice: 'もくもく会を投稿しました。'
    else
      flash.now[:alert] = '未入力の項目があります。'
      render :index
    end
  end

  def edit
    @post = Post.find_by(user_id: current_user.id)
  end

  def update
    if Post.find_by(user_id: current_user.id).update(post_params)
      redirect_to root_path, notice: '投稿内容を更新しました。'
    else
      flash.now[:alert] = '投稿内容を更新できませんでした。'
    end
  end

  def show
    @post = Post.find(params[:id])
  end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    redirect_to posts_path, notice: 'もくもく会の投稿を削除しました.'
  end

  private

  def post_params
    params.require(:post).permit(:title, :access_url, :description).merge(user_id: current_user.id)
  end
end

