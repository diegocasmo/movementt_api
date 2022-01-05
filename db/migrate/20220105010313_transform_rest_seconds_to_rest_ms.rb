class TransformRestSecondsToRestMs < ActiveRecord::Migration[6.1]
  MODELS = [
    Routine,
    RoutineExercise,
    Workout,
    WorkoutExercise,
  ]

  def up
    MODELS.each do |x|
      x.in_batches.each do |relation|
        relation.update_all('rest_ms = rest_ms * 1000')
      end
    end
  end

  def down
    MODELS.each do |x|
      model.in_batches.each do |relation|
        relation.update_all('rest_ms = rest_ms / 1000')
      end
    end
  end
end
