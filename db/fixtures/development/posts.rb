require 'random_data'

topics = Topic.all

50.times do |count|
  Post.seed do |p|
    p.id = count
    p.topic_id =  topics.sample.id
    p.title =  RandomData.random_sentence
    p.body = RandomData.random_paragraph
  end
end

puts "#{Post.count} posts created"
