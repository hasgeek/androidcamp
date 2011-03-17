class Vote < ActiveRecord::Base
  belongs_to :talk
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :talk_id

  validates_uniqueness_of :user_id, :scope => :talk_id

  # TODO counter_cache broken in rails v3.0.5
  before_save :increment_votes_count
  after_destroy :decrement_votes_count
  
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
