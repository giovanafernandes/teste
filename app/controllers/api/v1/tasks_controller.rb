class Api::V1::TasksController < ApplicationController
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
      render json: {:tasks => task.where('branch_id = ?', current_user.branch_id).order(id: :desc),
                    :branch_id => current_user.branch_id }
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
      task = Task.create(task_params)
      render json: task
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
      task = Task.find(params[:id])
      task.update_attributes(task_params)
      render json: task
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
      task.destroy(params[:id])
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
        @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
        params.require(:task).permit(:description, :priority, :work_id, :color_id)
    end

    def task_update_params
        params.require(:task).permit(:description, :isFinished, :justification, :priority, :work_id, :color_id)
    end
end
