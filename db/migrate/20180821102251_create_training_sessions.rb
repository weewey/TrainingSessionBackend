class CreateTrainingSessions < ActiveRecord::Migration[5.2]
  def up
    create_table :training_sessions do |t|
      t.date :date
      t.index :date
      t.integer :distance_in_km
      t.string :run_type
      t.string :time_of_day
      t.string :coach_comments

      t.timestamps null: false
    end
  end

  def down
    drop_table :training_sessions
  end
end
