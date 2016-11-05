require 'random_data'

topics = Topic.all
users = User.all

50.times do |count|
  #Post.seed do |p|
  #  p.id = count
  #  p.topic_id =  topics.sample.id
  #  p.user_id = users.sample.id
  #  p.title =  RandomData.random_sentence
  #  p.body = RandomData.random_paragraph

  #  p.created_at = rand(10.minutes .. 1.year).ago)

  #  rand(1..5).times { p.votes.create!(value: [-1, 1].sample, user: users.sample) }
  #end
  post = Post.create!(
    user:   users.sample,
    topic:  topics.sample,
    title:  RandomData.random_sentence,
    body:   RandomData.random_paragraph
  )

  post.update_attribute(:created_at, rand(10.minutes .. 1.year).ago)
  rand(1..5).times { post.votes.create!(value: [-1, 1].sample, user: users.sample) }
end



puts "#{Post.count} posts created"
puts "#{Vote.count} votes created"
