class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :other_user_favorites, -> (user) { user.posts.count == 0? all : where('post_id NOT IN (?)', user.posts.map(&:id)) }
end
