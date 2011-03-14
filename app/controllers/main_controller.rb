class MainController < ApplicationController
  def home
  end

  def login
    if current_user
      redirect_to root_url
    end
  end

end
