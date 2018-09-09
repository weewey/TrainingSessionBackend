class ConvertDistanceInKmToFloat < ActiveRecord::Migration[5.2]
  def up
    change_column :training_sessions, :distance_in_km, :float
  end

  def down
    change_column :training_sessions, :distance_in_km, :integer
  end
end
