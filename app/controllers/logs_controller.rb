class LogsController < ApplicationController
  # GET /logs
  def index
    @logs = Log.ransack(params).result.paginate(page: params[:page], per_page: params[:per_page] || 100)

    render json: @logs
  end

  # GET /logs/1
  def show
    render json: @log
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_log
      @log = Log.find(params[:id])
    end
end
