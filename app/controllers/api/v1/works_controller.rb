class Api::V1::WorksController < ApplicationController
  before_action :set_work, only: [:show, :edit, :update, :destroy]
  # GET /works
  # GET /works.json
  def index
    @works = Work.all
  end

  # GET /works/1
  # GET /works/1.json
  def show
  end

  # GET /works/new
  def new
  end

  # GET /works/1/edit
  def edit
  end

  # POST /works
  # POST /works.json
  def create
    work = Work.new(work_params)
    render json: work
  end

  # PATCH/PUT /works/1
  # PATCH/PUT /works/1.json
  def update
    work = Work.find(params[:id])
    work.update_attributes(work_params)
    render json: work
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
