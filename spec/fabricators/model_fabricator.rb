Fabricator(:model) do
  name       { Faker::Vehicle.manufacture }
  model_slug { Faker::Vehicle.unique.manufacture.parameterize('_') }
end
