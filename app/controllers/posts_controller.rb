class PostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ], controller: :posts
  def index
  end

  def new
  end

  def show
  end
end
