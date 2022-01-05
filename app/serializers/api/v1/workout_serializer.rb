class Api::V1::WorkoutSerializer < ActiveModel::Serializer
  attributes [
    :id,
    :name,
    :rounds,
    :rest_ms,
    :rounds_completed,
    :elapsed_ms,
    :started_at,
    :completed_at,
    :exercises,
    :created_at,
    :updated_at
  ]

  def exercises
    object.exercises.map do |exercise|
      Api::V1::WorkoutExerciseSerializer.new(exercise).attributes
    end
  end
end
