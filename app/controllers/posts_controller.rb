class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ], controller: :posts
  def index
    @post = Post.new
    @posts = Post.joins(:user).select("posts.id, posts.text, posts.created_at, users.name as post_user").ordered
    # binding.irb
  end

  def new
  end

  def show
    @post = Post.find(params[:id]) # 投稿のidをもとに投稿を選択
    @replies = Reply.joins(:user).select("replies.id, replies,text, replies.created_at, users.name as reply_user").reply_ordered
    @reply = @post.replies.build # 投稿に関連づけられたオブジェクトを生成
  end

  def create
     # 現在のユーザーに関連付けて投稿をビルドします。
    # これにより、post.user_id が自動的に current_user.id に設定されます。
    @post = current_user.posts.build(post_params)

    # 投稿の保存に失敗した場合に備え、@posts を再取得します。
    # これにより、render :index が呼び出されたときに、
    # 既存の投稿が正しく表示され、post_user エイリアスが利用可能になります。
    @posts = Post.joins(:user).select("posts.id, posts.text, posts.created_at, users.name as post_user").ordered
    # binding.irb
    if @post.save
      redirect_to root_path, notice: "Post was successfully created."
    else
      flash.now[:alert] = "Post could not be created."
      render :index, status: :unprocessable_entity
    end
  end

  def destroy
    @post = Post.find(params[:id])
    if @post.destroy
      redirect_to root_path, notice: "Post was successfully deleted."
    else
      flash.now[:alert] = "Post could not be deleted."
      render :index, status: :unprocessable_entity
    end
  end

   private
    def post_params
      params.require(:post).permit(:text, :post_user)
    end

    # def post_user
    #   user = Post.where([:user_id])
    # end
end
