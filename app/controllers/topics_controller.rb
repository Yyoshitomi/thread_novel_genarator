class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = Topic.new(topic_params)
    @topic.save
      redirect_to topics_path
  end

  def edit
    @topic = Topic.find(params[:id])
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_to topics_path
    else
      render 'edit'
    end
  end

  def show
    @topic = Topic.find(params[:id])
    @props = render_to_string(template: "api/topic/show.json.jbuilder", format: :json)
    @threadConfig = render_to_string(template: "api/topic/config.json.jbuilder", format: :json)
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
      redirect_to topics_path, :notice => "Your post has been deleted successfully."
  end

  private

  def topic_params
    params.require(:topic).permit(:title, :default_name, :time_display)
  end


end
