class User < ApplicationRecord
  mount_uploader :avatar, ImageUploader
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_many :pins
  has_many :comments, dependent: :destroy
  

  acts_as_voter
  #A user has_many relationships. 
  #A User following another user is an active relationship.
  has_many :active_relationships, class_name: "Relationship", 
                                  foreign_key: "follower_id", 
                                  dependent: :destroy	
  #A User who is being follwed by another user is a passive relationship.                                 
  has_many :passive_relationships, class_name:  "Relationship",
                                   foreign_key: "followed_id",
                                   dependent:   :destroy		
  #A user has many following through relationships.                                 						  
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :following, through: :active_relationships, source: :followed

  validates_presence_of   :avatar
  validates_integrity_of  :avatar
  validates_processing_of :avatar
  validates_uniqueness_of :username

  # Returns a user's status feed: Display pins where the pins user_id is in the list of following_ids. Order pins so the newest posts are at the top.  
  def feed
    Pin.where("user_id IN (:following_ids)",
                    following_ids: following_ids, user_id: id).order("created_at DESC")
  end

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    following.delete(other_user)
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    following.include?(other_user)
  end

end
