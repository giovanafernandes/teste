class Api::V1::JobsController < ApplicationController
  before_action :set_job, only: [:show, :edit, :update, :destroy]

  # GET /jobs
  # GET /jobs.json
  def index
      render json: {:jobs => Job.where('branch_id = ?', current_user.branch_id).order(id: :desc),
                    :branch_id => current_user.branch_id }
  end

  # GET /jobs/1
  # GET /jobs/1.json
  def show
  end

  # GET /jobs/new
  def new
    @job = Job.new
  end

  # GET /jobs/1/edit
  def edit
  end

  # POST /jobs
  # POST /jobs.json
  def create
      job = Job.create(job_params)
      render json: job
  end

  # PATCH/PUT /jobs/1
  # PATCH/PUT /jobs/1.json
  def update
      job = Job.find(params[:id])
      job.update_attributes(job_params)
      render json: job
  end

  # DELETE /jobs/1
  # DELETE /jobs/1.json
  def destroy
      Job.destroy(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_job
        @job = Job.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def job_params
        params.require(:job).permit(:description, :third, :salary, :branch_id)
    end
end
