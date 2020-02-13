class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  layout "loggedin"

  # GET /users
  # GET /users.json
  def index
    @users = User.where("id != ?", current_user.id)
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    @user = User.new
    @access = Access.new
    @jobs = Job.where('branch_id = ?', current_user.branch_id).order(id: :desc)
    @branch_id = current_user.branch_id

    return @user, @access, @jobs, @branch_id
  end

  # GET /users/1/edit
  def edit
      @access = Access.find(@user.access_id)
      @jobs = Job.where('branch_id = ?', current_user.branch_id).order(id: :desc)
      @branch_id = current_user.branch_id

      return @access, @jobs, @branch_id
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)
    @access = Access.new(access_params)
    @user.access_id = set_access @access

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: {user: @user.errors,access: @access}, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    aux = User.find(params[:id])
    userAux = User.new(user_params)
    @access = Access.new(access_params)
    userAux.access_id = set_access @access

    att = {
        name: userAux.name,
        email: userAux.email,
        password_digest: aux.password_digest,
        user_type_id: userAux.user_type_id,
        access_id: userAux.access_id,
        branch_id: userAux.branch_id,
        job_id: userAux.job_id
    }

    respond_to do |format|
      if @user.update att
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation, :user_type_id, :access_id, :branch_id, :job_id)
    end

    def user_update_params
      params.require(:user).permit(:id, :name, :email, :user_type_id, :access_id, :branch_id, :job_id)
    end

    def access_params
      params.require(:access).permit(:toCreate, :toRead, :toUpdate, :toDelete)
    end

    def set_access access
        aux = Access.where("toCreate = ? and toRead = ? and toUpdate = ? and toDelete = ?", access.toCreate, access.toRead, access.toUpdate, access.toDelete).first()
        aux.id
    end
end
