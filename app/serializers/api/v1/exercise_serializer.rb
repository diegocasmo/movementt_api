class Api::V1::ExerciseSerializer < ActiveModel::Serializer
  attributes [
    :id,
    :name,
    :movement_type,
    :created_at,
    :updated_at
  ]
end
