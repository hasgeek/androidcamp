class TalksController < ApplicationController

  before_filter :auth_user, :except => [:index, :show, :popular, :newest]
  before_filter :current_user, :only =>[:index, :show]

  def newest
    @talks = Talk.order("created_at DESC")
    render :talk_list
  end
  
  #shows popular talks
  def index
    @talks = Talk.order("votes_count DESC")
    render :talk_list
  end

  def show
    @talk = Talk.find(params[:id])
    @comment = @talk.comments.build
  end

  def new
    @talk = Talk.new
    @talk.user_id = @current_user.id
  end

  def edit
    @talk = Talk.find(params[:id])
  end

  def create
    @talk = Talk.new(params[:talk])
    @talk.user_id = @current_user.id
    if request.xhr?
      if @talk.save
        render :json => @talk
      else
        render :json => @talk.errors, :status => :unprocessable_entity
      end
    else
      if @talk.save
        redirect_to(@talk, :notice => 'Talk was successfully created.')
      else
        render :action => "new"
      end
    end
  end

  def update
    @talk = Talk.find(params[:id])

    if @talk.update_attributes(params[:talk])
      redirect_to(@talk, :notice => 'Talk was successfully updated.')
    else
      render :action => "edit"
    end
  end

  def destroy
    @talk = Talk.find(params[:id])
    @talk.destroy
    redirect_to(talks_url)
  end

end
