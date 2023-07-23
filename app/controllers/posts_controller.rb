class PostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :set_post, only: [:edit, :update, :show, :destroy]

  def index
    @posts = Post.all
  end

  def edit
    @posts = Post.all
  end

  def update
    if @post.update(post_params)
      redirect_to post_path(@post)
    else
      render :edit
    end
  end

  def new
    @post = Post.new
    @posts = Post.all
  end

  def create
     @post = current_user.posts.build(post_params)
     @genre = Genre.find(params[:post][:genre_id])
    if @post.save
      redirect_to post_path(@post)
    else
      render :new
    end
  end

  def show
    @posts = Post.all
  end

  def destroy
    if @post.user == current_user
      @post.destroy
      redirect_to post_path(@post), notice: "投稿を削除しました。"
    else
      redirect_to root_path, alert: "他のユーザーの投稿は削除できません。"
    end
  end

  private

  def post_params
    params.require(:post).permit(:genre_id, :title, :text, :image)
  end

  def set_post
    @post = Post.find(params[:id])
  end

end
