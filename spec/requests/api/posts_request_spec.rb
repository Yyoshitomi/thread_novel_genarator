require 'rails_helper'

RSpec.describe "Api::Posts", type: :request do

  describe "POST /create" do
    it "returns ok" do
      Topic.create(
        id: 1,
        title: "スレタイ",
        default_name: "名無しさん",
        time_display: false
      )

      post '/api/posts', params: { format: :json,
                                    post: {
                                      topic_id: 1,
                                      name: "名無しさん",
                                      honbun: "今日も空が青い。",
                                      number: 1
                                    }
                                  }
      expect(response).to have_http_status(201)
    end

    it "トピックの最初のレスが正しく追加されていること" do
      Topic.create(
        id: 1,
        title: "スレタイ",
        default_name: "名無しさん",
        time_display: false
      )

      post '/api/posts', params: { format: :json,
                                    post: {
                                      topic_id: 1,
                                      name: "名無しさん",
                                      honbun: "今日も空が青い。",
                                      number: 1
                                    }
                                  }
      expect(Post.last.name).to eq "名無しさん"
      expect(Post.last.honbun).to eq "今日も空が青い。"
      expect(Post.last.number).to eq 1
    end
    
    it "returns ok" do
      Topic.create(
        id: 1,
        title: "スレタイ",
        default_name: "名無しさん",
        time_display: false
      )

      post '/api/posts', params: { format: :json,
                                    post: {
                                      topic_id: 1,
                                      name: "名無しさん",
                                      honbun: nil,
                                      number: 1
                                    }
                                  }
      expect(response.status).to eq(400)
    end
  end
end
