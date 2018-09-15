# frozen_string_literal: true

module TrainingSessionScopes
  extend ActiveSupport::Concern

  included do
    default_scope { order(date: :asc, time_of_day: :asc) }

    scope :between_date, ->(from_date, to_date) do
      from_date = Date.strptime(from_date, '%d/%m/%Y')
      to_date = Date.strptime(to_date, '%d/%m/%Y')
      where('date >= ? AND date <= ?', from_date, to_date)
    end
  end
end
