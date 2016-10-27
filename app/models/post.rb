class Post < ApplicationRecord
  belongs_to :topic
  has_many :comments, dependent: :destroy

  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :topic, presence: true

  def self.update_spam
    posts = Post.all
    posts.each_with_index do |post, index|
      if index == 0 || index % 5 == 0
        post.update_attribute(:title, 'SPAM')
      end
    end
  end
end
