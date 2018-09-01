class TrainingSessionsController < ActionController::API
  before_action :set_training_sessions, only: [:show, :update]

  def show
    render json: formatted_response
  end

  def update
    if @training_sessions.update(update_training_session_params)
      render nothing: true, status: :ok
    else
      render nothing: true, status: :bad_request
    end
  end

  private

  def set_training_sessions
    return @training_sessions = TrainingSession.where(date: params[:date]) if params[:date]
    @training_sessions = TrainingSession.find(params[:id])
  end

  private

  def formatted_response
    formatted_results = @training_sessions.map do |training_session|
      training_session
        .slice(:id, :date, :distance_in_km, :time_of_day, :coach_comments)
        .deep_transform_keys { |key| key.camelize(:lower) }
        .merge('date': training_session.date.strftime('%d/%m/%Y'),
               'type': training_session.run_type.camelize(:lower))
    end
    { 'trainingSessions': formatted_results }
  end

  def update_training_session_params
    params.require(:training_session).permit(:heart_rate, :feedback, :executed_workout_pace,
                                             :duration, :date, :distance_in_km)
  end
end
