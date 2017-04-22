class ModelType < ActiveRecord::Base
  belongs_to :model

  validates :model_type_slug, presence: true, uniqueness: true

  def total_price
    0
    # TODO: Calculate total price from base price
  end
end
