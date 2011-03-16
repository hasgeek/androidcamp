class Vote < ActiveRecord::Base
  belongs_to :talk
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :talk_id

  before_create :increment_votes_count
  before_destroy :decrement_votes_count
  
  private
  def increment_votes_count
    talk = self.talk
    talk.votes_count = talk.votes_count.succ
    talk.save
  end

  def decrement_votes_count
    talk = self.talk
    talk.votes_count = talk.votes_count.pred
    talk.save
  end
end
