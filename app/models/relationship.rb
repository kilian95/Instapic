class Relationship < ApplicationRecord

	#Since relationships involve 2 users - a relationship belongs_to both the follower and the followed user.
	belongs_to :follower, class_name: "User"
	belongs_to :followed, class_name: "User"
	
	validates :follower_id, presence: true
	validates :followed_id, presence: true
end
  