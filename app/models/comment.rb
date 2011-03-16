class Comment < ActiveRecord::Base
  belongs_to :talk, :counter_cache=>true
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :talk_id
  validates_presence_of :description, :message=>"Saying nothing doesn't require a comment ;)"
end
