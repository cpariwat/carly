class ModelType < ActiveRecord::Base
  belongs_to :model

  validates :model_type_slug, presence: true, uniqueness: true
end
