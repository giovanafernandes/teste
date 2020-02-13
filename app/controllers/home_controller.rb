class HomeController < ApplicationController
  def index
  end

  def app
    if !current_user
        redirect_to '/login'
    else
        render :layout => 'loggedin'
    end
  end
end
