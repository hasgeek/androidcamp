class CommentsController < ApplicationController

  before_filter :auth_user
  load_and_authorize_resource
  
  def create
    @comment = Comment.new params[:comment]
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
    @comment = Comment.includes(:talk).find(params[:id])
  end

  def update
    @comment = Comment.find params[:id]

    if @comment.save
      redirect_to comment_url(@comment)
    else
      render :edit
    end
  end

  def show
    @comment = Comment.find params[:id]
  end
  
  def destroy
    @comment = Comment.find params[:id]
    @comment.destroy
  end
  
end
