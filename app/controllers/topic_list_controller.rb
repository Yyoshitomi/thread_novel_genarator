class TopicListController < ApplicationController
  def index
    @topics = Topic.all

    render "topic_list/index"
  end
end
