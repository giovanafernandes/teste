class WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy, :spreadsheet]
  # GET /works
  # GET /works.json
  def index
    render :layout => 'loggedin'
    @works = Work.all
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
    @work = Work.create

    redirect_to "/works/spreadsheet/#{@work.id}"
  end

  # GET /works/spreadsheet
  def spreadsheet
    @work = Work.find(params[:id])
    @colors = Color.all
    @tasks = Task.where('work_id = ?', @work.id)
    branch = Branch.where('id = ?', current_user.branch_id).first
    @companies = Company.where('membership_id = ?', branch.membership_id)
    @branches = Branch.where('membership_id = ?', branch.membership_id)
    @users = Array.new
    @branches.each do |b|
        @users.concat User.where('branch_id = ?', b.id)
    end

    render :layout => 'blank'
    return @work, @colors, @companies, @branches, @users, @tasks
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    @work = Work.new(work_params)

    respond_to do |format|
      if @work.save
        format.html { redirect_to @work, notice: 'Work was successfully created.' }
        format.json { render :show, status: :created, location: @work }
      else
        format.html { render :new }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    respond_to do |format|
      if @work.update(work_params)
        format.html { redirect_to @work, notice: 'Work was successfully updated.' }
        format.json { render :show, status: :ok, location: @work }
      else
        format.html { render :edit }
        format.json { render json: @work.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /works/1
  # DELETE /works/1.json
  def destroy
    @work.destroy
    respond_to do |format|
      format.html { redirect_to works_url, notice: 'Work was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_work
      @work = Work.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def work_params
      params.require(:work).permit(:start, :end, :isFinished, :budget, :Company_id, :User_id)
    end
end
