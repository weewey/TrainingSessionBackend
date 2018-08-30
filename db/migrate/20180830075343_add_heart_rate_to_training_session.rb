class AddHeartRateToTrainingSession < ActiveRecord::Migration[5.2]
  def up
    add_column :training_sessions, :heart_rate, :int, null: true
  end

  def down
    remove_column :training_sessions, :heart_rate
  end
end
