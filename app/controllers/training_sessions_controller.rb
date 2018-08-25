class TrainingSessionsController < ActionController::API
  before_action :set_training_sessions, only: [:show]

  def show
    render json: formatted_response
  end

  private

  def set_training_sessions
    requested_date = params[:date]
    @training_sessions = TrainingSession.where(date: requested_date)
  end

  def formatted_response
    formatted_results = @training_sessions.map do |training_session|
      training_session
        .attributes
        .except('id', 'created_at', 'updated_at')
        .deep_transform_keys { |key| key.camelize(:lower) }
        .merge('date': training_session.date.strftime('%d/%m/%Y'))
    end
    { 'trainingSessions': formatted_results }
  end
end
