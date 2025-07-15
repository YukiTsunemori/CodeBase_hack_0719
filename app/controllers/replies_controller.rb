class RepliesController < ApplicationController
  # def index
  #   @post = Post.find(params[:post_id])
  #   @replies = @post.replies.ordered
  # end

  def new
  end

  def show
  end

  def edit
  end

  def create
    @post = Post.find(params[:post_id])
    @reply = @post.replies.build(reply_params)
    # @replyies = @post.replies.ordered
    if @reply.save
      redirect_to post_path(@post), notice: "Reply was successfully created."
    else
      flash.now[:alert] = "Reply could not be created."
      render @post, status: :unprocessable_entity
    end
  end

  private
    def reply_params
      params.require(:reply).permit(:text, :user_id).merge(post_id: params[:post_id])
    end
end
