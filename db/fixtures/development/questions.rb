require 'random_data'

50.times do |count|
  Question.seed do |q|
    q.id = count
    q.title = RandomData.random_sentence
    q.body = RandomData.random_paragraph
    q.resolved = false
  end
end

 puts "#{Question.count} question created"
