class MainController < ApplicationController

  def login
    if current_user
      redirect_to root_url
    end
  end

end
