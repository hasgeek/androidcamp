class TalksController < ApplicationController

  before_filter :auth_user, :except => [:index, :show, :home]
  before_filter :current_user, :only =>[:index, :show]

  def home
  end
  
  def index
    @talks = Talk.all
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

    if @talk.save
      redirect_to(@talk, :notice => 'Talk was successfully created.')
    else
      render :action => "new"
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
