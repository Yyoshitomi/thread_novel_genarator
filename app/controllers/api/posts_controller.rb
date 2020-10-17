class Api::PostsController < ApplicationController
  def create
    @post = Post.new(post_params)

    if @post.save
      head :ok
    else
      render json: { status: 'ERROR', data: @post.errors }
    end
  end

  private

  def post_params
    params.require(:post).permit(:number, :name, :date, :ch_id, :honbun, :topic_id)
  end
end
