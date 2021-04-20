class DistanceRecordsController < ApplicationController
  before_action :set_distance_record, only: %i[ show edit update destroy ]
  after_action :load_last_records, only: %i[ create ]
  # GET /distance_records or /distance_records.json
  def index
    @distance_records = DistanceRecord.all.order("created_at Desc").paginate(page: params[:page], per_page: 5)
  end

  # GET /distance_records/1 or /distance_records/1.json
  def show
  end

  # GET /distance_records/new
  def new
    @distance_record = DistanceRecord.new
  end

  # GET /distance_records/1/edit
  def edit
  end

  # POST /distance_records or /distance_records.json
  def create
    @distance_record, @response = DistanceRecords::Creator.call(params, distance_record_params)
    respond_to do |format|
      format.js
    end
  end

  # PATCH/PUT /distance_records/1 or /distance_records/1.json
  def update
    respond_to do |format|
      if @distance_record.update(distance_record_params)
        format.html { redirect_to @distance_record, notice: "Distance record was successfully updated." }
        format.json { render :show, status: :ok, location: @distance_record }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @distance_record.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /distance_records/1 or /distance_records/1.json
  def destroy
    @distance_record.destroy
    respond_to do |format|
      format.html { redirect_to distance_records_url, notice: "Distance record was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_distance_record
      @distance_record = DistanceRecord.find(params[:id])
    end

    def load_last_records
      @distance_records_list = DistanceRecord.last(5)
    end

    # Only allow a list of trusted parameters through.
    def distance_record_params
      params.require(:distance_record).permit(:initial_point, :final_point, :distance_in_between)
    end
end
