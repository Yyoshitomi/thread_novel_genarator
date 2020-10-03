json.topic do
  json.extract! @topic, :title, :start_date
  json.posts do
    json.array! @topic.posts, :name, :honbun, :number, :ch_id
  end
end
