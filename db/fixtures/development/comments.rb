require 'random_data'

posts = Post.all
users = User.all

100.times do |count|
  Comment.seed do |c|
    c.id = count
    c.user_id = users.sample.id
    c.post_id = posts.sample.id
    c.body = RandomData.random_paragraph
  end
end

puts "#{Comment.count} comments created"
