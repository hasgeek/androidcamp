class User < ActiveRecord::Base

  has_many :talks
  has_many :comments, :through => :talks
  has_many :votes, :through => :talks

  def self.create_with_omniauth(auth)
    create! do |user|
      user.provider = auth["provider"]
      user.uid = auth["uid"]
      user.name = auth["user_info"]["name"]
      user.email = auth["user_info"]["email"]
    end
  end

  def voted_for?(talkID)
    return true unless Talk.find(talkID).votes.exists?(:user_id=>self.id)
    return false
  end
  
end
