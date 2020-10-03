class Api::TopicController < ApplicationController

    def index

    # @hello_world_props = {
    #   responses: [{ 
    #       name: "本当にあった怖い名無し",
    #       number: 108,
    #       date: "2008/05/19(月) 15:49:43",
    #       ch_id: "NANtEKit0",
    #       honbun: honbun
    #     },
    #     { 
    #       name: "本当にあった怖い名無し",
    #       number: 108,
    #       date: "2008/05/19(月) 15:49:43",
    #       ch_id: "NANtEKit0",
    #       honbun: honbun
    #     }]
    #   }
  end

  def show
    @topic = Topic.find(params[:id])
  end

end
