class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes [
    :id,
    :uid,
    :email,
    :verified,
    :weight_unit_type,
    :created_at,
    :updated_at
  ]
end
