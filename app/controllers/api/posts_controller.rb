class Api::PostsController < ApplicationController
  def create

    @post = Post.new(params[:id])

    if @post.save
      head :ok
    else
      render json: { status: 'ERROR', data: @post.errors }
    end
  end

  private

  def post_params
  end
end
