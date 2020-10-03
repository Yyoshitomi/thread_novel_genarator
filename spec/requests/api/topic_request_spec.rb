require 'rails_helper'

RSpec.describe "Api::Topics", type: :request do

  let(:topic) { create(:title, :default_name) }

  it 'idが存在するtopicの表示は成功する' do
    topic = Topic.create!(
      id: 1,
      title: "スレタイ",
      default_name: "名無しさん"
    )
    

    get '/api/topic/1', params: { format: :json}
    expect(response.status).to eq(200)
  end

end
