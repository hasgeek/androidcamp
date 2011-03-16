class Comment < ActiveRecord::Base
  belongs_to :talk
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :talk_id
  validates_presence_of :description, :message=>"Saying nothing doesn't require a comment ;)"

  before_create :increment_comments_count
  before_destroy :decrement_comments_count
  
  private
  def increment_comments_count
    talk = self.talk
    talk.comments_count = talk.comments_count.succ
    talk.save
  end

  def decrement_comments_count
    talk = self.talk
    talk.comments_count = talk.comments_count.pred
    talk.save
  end
  
end
