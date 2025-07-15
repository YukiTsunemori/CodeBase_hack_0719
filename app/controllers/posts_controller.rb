class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ], controller: :posts
  def index
    @post = Post.new
    @posts = Post.ordered
  end

  def new
  end

  def show
    @post = Post.find(params[:id]) # 投稿のidをもとに投稿を選択
    @replies = @post.replies.ordered # 投稿に関連づけられた返信を一覧で取得
    @reply = @post.replies.build # 投稿に関連づけられたオブジェクトを生成
  end

  def create
    @post = Post.new(post_params)
    @posts = Post.ordered
    # binding.irb
    if @post.save
      redirect_to root_path, notice: "Post was successfully created."
    else
      flash.now[:alert] = "Post could not be created."
      render :index, status: :unprocessable_entity
    end
  end

   private
    def post_params
      params.require(:post).permit(:text, :user_id)
    end
end
