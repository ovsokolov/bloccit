require 'random_data'

topics = Topic.all

50.times do |count|
  SponsoredPost.seed do |p|
    p.id = count
    p.topic_id =  topics.sample.id
    p.title =  RandomData.random_sentence
    p.body = RandomData.random_paragraph
    p.price = rand(1..25)
  end
end

puts "#{SponsoredPost.count} sponsored posts created"
