class PostsController < ApplicationController

  before_action :authenticate_user!, :except =>[:index]

  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.save
    redirect_to '/posts'
  end

  def post_params
    params.require(:post).permit(:image)
  end
end
