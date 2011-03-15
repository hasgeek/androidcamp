class VotesController < ApplicationController

  before_filter :auth_user
  
  def create
    @vote = Vote.new(params[:vote])
    @vote.user_id = @current_user.id

    if @vote.valid?
      votes = @vote.talk.votes.where(:user_id=>@vote.user_id)
      if votes.count > 0
        @vote = votes.first
        render :json => @vote
        return
      end
    end

    if request.xhr?
      if @vote.save
        render :json => @vote
      else
        render :json => @vote.errors, :status => :unprocessable_entity
      end
    end
  end

end
