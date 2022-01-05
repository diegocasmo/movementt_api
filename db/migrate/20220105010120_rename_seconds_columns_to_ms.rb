class RenameSecondsColumnsToMs < ActiveRecord::Migration[6.1]
  def change
    rename_column :routines, :rest_seconds, :rest_ms
    rename_column :routine_exercises, :rest_seconds, :rest_ms

    rename_column :workouts, :rest_seconds, :rest_ms
    rename_column :workout_exercises, :rest_seconds, :rest_ms
  end
end
