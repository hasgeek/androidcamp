class Vote < ActiveRecord::Base
  belongs_to :talk, :counter_cache=>true
  belongs_to :user

  validates_presence_of :user_id
  validates_presence_of :talk_id
end
