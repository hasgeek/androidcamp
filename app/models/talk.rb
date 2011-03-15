class Talk < ActiveRecord::Base
  belongs_to :user
  has_many :comments
  has_many :votes

  validates_presence_of :title
  validates_presence_of :description
end
