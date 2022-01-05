class Api::V1::RoutineSerializer < ActiveModel::Serializer
  attributes [
    :id,
    :name,
    :rounds,
    :rest_ms,
    :exercises,
    :created_at,
    :updated_at
  ]

  def exercises
    object.exercises.map do |exercise|
      Api::V1::RoutineExerciseSerializer.new(exercise).attributes
    end
  end
end
