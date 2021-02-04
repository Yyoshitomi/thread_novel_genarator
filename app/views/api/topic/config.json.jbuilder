json.threadConfig do
  json.topicId @topic.id
  json.number @topic.posts.last.number + 1
  json.defaultName @topic.default_name
  json.timeDisplay @topic.time_display
  json.defaultID Post.id_generator
end