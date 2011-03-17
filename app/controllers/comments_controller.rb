class CommentsController < ApplicationController

  before_filter :auth_user

  def create
    @comment = Comment.new(params[:comment])
    @comment.user_id = @current_user.id
    if request.xhr?
      if @comment.save
        render :text => @comment.to_json(:include=>{:user=>{:only=>[:name]}})
      else
        render :json => @comment.errors, :status => :unprocessable_entity
      end
    end
  end

  def edit
    #TODO
  end
  
  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
  end
  
end
