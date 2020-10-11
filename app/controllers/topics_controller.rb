class TopicsController < ApplicationController

  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
    @props = render_to_string(template: "api/topic/show.json.jbuilder", format: :json)
    @threadConfig = render_to_string(template: "api/topic/config.json.jbuilder", format: :json)
  end

end
