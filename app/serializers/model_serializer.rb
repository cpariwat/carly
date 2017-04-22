class ModelSerializer < ActiveModel::Serializer
  attributes :name

  has_many :model_types
end
