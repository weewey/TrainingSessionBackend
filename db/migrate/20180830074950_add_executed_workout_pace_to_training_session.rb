class AddExecutedWorkoutPaceToTrainingSession < ActiveRecord::Migration[5.2]
  def up
    add_column :training_sessions, :executed_workout_pace, :string, null: true
  end

  def down
    remove_column :training_sessions, :executed_workout_pace
  end
end
