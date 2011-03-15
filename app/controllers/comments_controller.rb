class CommentsController < ApplicationController

  before_filter :auth_user

  def create
    @comment = Comment.new(params[:comment])
    @comment
    if request.xhr?
      if @comment.save
        render :json => @comment
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
