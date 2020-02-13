class Api::V1::UsersController < ApplicationController
  # before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    render json: User.where("id != ?", current_user.id)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    branch = Branch.find(current_user.branch_id)
    @branchs = Branch.where("membership_id = ?", branch.membership_id)
    @access = Access.new

    return @user, @access, @branchs
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    user = User.create(user_params)
    render json: user
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
      user = User.find(params[:id])
      user.update_attributes(user_params)
      render json: user
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
     User.destroy(params[:id])
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password_digest, :user_type_id, :access_id, :branch_references)
    end
end
