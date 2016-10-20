#require 'random_data'
# #Create uniques post
# unique_post = Post.find_or_create_by!(
#                    title: "Sample Unique Title",
#                    body: "Sample Unique Body"
#               )
#
#Comment.find_or_create_by!(
#
#  post: unique_post,
#  body: 'Sample Unique Comment'
#)
#
#2.times do
#  Post.create(
#        title: "Non Unique Title",
#        body: "Non Unique Body"
#  )
#end
#
# # Create Posts
# 50.times do
#   Post.create!(
#
#     title:  RandomData.random_sentence,
#     body:   RandomData.random_paragraph
#   )
# end
# posts = Post.all
#
# # Create Comments
#
# 100.times do
#   Comment.create!(
#
#     post: posts.sample,
#     body: RandomData.random_paragraph
#   )
# end
#
#75.times do
#   Advertisement.create!(
#
#     title:  RandomData.random_sentence,
#     body:   RandomData.random_paragraph,
#     price:  RandomData.random_price
#   )
# end
#
# puts "Seed finished"
# puts "#{Post.count} posts created"
# puts "#{Comment.count} comments created"
# puts "#{Advertisement.count} advertisement created"
#
