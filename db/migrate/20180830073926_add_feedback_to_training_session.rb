class AddFeedbackToTrainingSession < ActiveRecord::Migration[5.2]
  def up
    add_column :training_sessions, :feedback, :string, null: true
  end

  def down
    remove_column :training_sessions, :feedback
  end
end