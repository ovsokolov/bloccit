class Post < ApplicationRecord
  has_many :comments

  def self.update_spam
    posts = Post.all
    posts.each_with_index do |post, index|
      if index == 0 || index % 5 == 0
        post.update_attribute(:title, 'SPAM')
      end
    end
  end
end
