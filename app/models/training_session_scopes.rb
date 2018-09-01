class TrainingSession < ActiveRecord::Base
  default_scope { order(created_at: :asc) }
end