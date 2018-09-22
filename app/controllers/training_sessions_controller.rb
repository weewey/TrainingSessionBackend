class TrainingSessionsController < ActionController::API
  before_action :set_training_sessions, only: [:show, :update]

  RESPONSE_WITHOUT_FEEDBACK_FIELDS = [:id, :date, :distance_in_km, :time_of_day, :coach_comments]
  RESPONSE_WITH_FEEDBACK_FIELDS = RESPONSE_WITHOUT_FEEDBACK_FIELDS + [:duration, :feedback, :heart_rate, :executed_workout_pace]

  def create
    @training_session = TrainingSession.new(new_training_session_params)
    if @training_session.valid? && @training_session.save
      logger.info("training session saved")
      render nothing: true, status: :created
    else
      logger.error("training session failed to save")
      render nothing: true, status: :bad_request
    end
  end

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
      response_fields = isUpdatedWithFeedback?(training_session) ? RESPONSE_WITH_FEEDBACK_FIELDS : RESPONSE_WITHOUT_FEEDBACK_FIELDS
      format_response(training_session, response_fields)
    end
    { 'trainingSessions': formatted_results }
  end

  def isUpdatedWithFeedback?(training_session)
    !(training_session.heart_rate.blank? &&
      training_session.feedback.blank? &&
      training_session.executed_workout_pace.blank?)
  end

  def format_response(training_session, returned_fields)
    training_session
      .slice(*returned_fields)
      .deep_transform_keys { |key| key.camelize(:lower) }
      .merge('date': training_session.date.strftime('%d/%m/%Y'),
             'type': training_session.run_type.camelize(:lower))
  end

  def new_training_session_params
    params.require(:training_session).permit(:date, :distance_in_km, :run_type, :time_of_day,
                                             :coach_comments, :feedback, :duration, :executed_workout_pace,
                                             :heart_rate)
  end

  def update_training_session_params
    params.require(:training_session).permit(:heart_rate, :feedback, :executed_workout_pace,
                                             :duration, :date, :distance_in_km)
  end
end
