class Comment < ActiveRecord::Base
  belongs_to :talk

  validates_presence_of :user_id
  validates_presence_of :talk_id
end
