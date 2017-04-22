class Model < ActiveRecord::Base
  belongs_to :organization
  has_many :model_types

  validates :model_slug, presence:true, uniqueness: true
end
