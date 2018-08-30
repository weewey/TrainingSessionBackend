class AddDurationToTrainingSession < ActiveRecord::Migration[5.2]
  def up
    add_column :training_sessions, :duration, :int, null: true
  end

  def down
    remove_column :training_sessions, :duration
  end
end
