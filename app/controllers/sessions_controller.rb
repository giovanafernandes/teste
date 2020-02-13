class SessionsController < ApplicationController

  def new
      if current_user
          redirect_to '/app'
      end
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id

      if user.branch_id.nil?
          session[:membership] = false
      end

      redirect_to "/app"
    else
      redirect_to "/login", alert: "Couldn't find your Plusing Account"
    end
  end

  def destroy
  	session[:user_id] = nil
    session[:membership] = nil
  	redirect_to root_url
  end

  def register
      if current_user
          redirect_to '/app'
      end
      @user = User.new
  end

  def signup
    access = Access.where('toCreate = 1 and toRead = 1 and toUpdate = 1 and toDelete = 1').first

    att = {
      name: params[:name],
      email: params[:email],
      password: params[:password],
      password_confirmation: params[:password_confirmation],
      user_type_id: 1,
      access_id: access.id
    }

    @user = User.new(att)

    if @user.save
      self.create
    else
      respond_to do |format|
          format.html { render :register }
          format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type_id, :access_id)
    end
end
