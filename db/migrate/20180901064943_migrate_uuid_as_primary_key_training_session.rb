class MigrateUuidAsPrimaryKeyTrainingSession < ActiveRecord::Migration[5.2]
  def change
    add_column :training_sessions, :uuid, :uuid, default: "gen_random_uuid()", null: false

    change_table :training_sessions do |t|
      t.remove :id
      t.rename :uuid, :id
    end

    execute "ALTER TABLE training_sessions ADD PRIMARY KEY (id);"
  end
end
