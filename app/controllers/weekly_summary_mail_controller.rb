class WeeklySummaryMailController < ActionController::API

  def create
    from_date = params[:from_date]
    to_date = params[:to_date]
    begin
      WeeklyTrainingLogsMailer.weekly_summary_email(from_date, to_date).deliver_now
      render nothing: true, status: :ok
    rescue StandardError => error
      logger.error(error)
      render json: { status: 'error', message: error }, status: :bad_request
    end
  end
end
