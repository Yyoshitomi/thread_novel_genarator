json.topic do
  json.extract! @topic, :title
  json.posts do
    json.array! @topic.posts, :name, :honbun, :number, :date, :ch_id
  end
end
