class TrainingSession < ActiveRecord::Base
  include TrainingSessionScopes

  enum run_type: { easy: 'easy', interval: 'interval', long_run: 'long_run',
                   tempo_run: 'tempo_run', fartlek: 'fartlek', race: 'race' }

  enum time_of_day: { AM: 'AM', PM: 'PM' }

  validates :run_type, presence: true
  validates :time_of_day, presence: true
  validates :date, presence: true
  validate :training_session_date_to_be_current_year
  validates :distance_in_km, presence: true, numericality: { greater_than: 0 }

  def training_session_date_to_be_current_year
    errors.add(:date, 'must be in current year') unless date.year == Date.today.year
  end
end