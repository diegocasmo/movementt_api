class Api::V1::UserSerializer < ActiveModel::Serializer
  attributes [
    :id,
    :uid,
    :email,
    :verified,
    :created_at,
    :updated_at
  ]
end
