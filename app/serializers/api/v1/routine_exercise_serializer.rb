class Api::V1::RoutineExerciseSerializer < ActiveModel::Serializer
  attributes [
    :id,
    :name,
    :category_type,
    :movement_type,
    :weight_unit_type,
    :distance_unit_type,
    :quantity,
    :weight,
    :rest_ms,
    :position,
    :created_at,
    :updated_at
  ]
end
