class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes [
    :id,
    :uid,
    :email,
    :weight_unit_type,
    :distance_unit_type,
    :created_at,
    :updated_at
  ]
end
