require 'random_data'

50.times do |count|
  Post.seed do |p|
    p.id = count
    p.title =  RandomData.random_sentence,
    p.body = RandomData.random_paragraph
  end
end

puts "#{Post.count} posts created"
