Fabricator(:model_type) do
  name            { Faker::Commerce.product_name }
  model_type_slug { Faker::Commerce.unique.product_name.parameterize('_') }
  model_type_code { Faker::Code.asin }
  base_price      { Random.rand(10_000...100_000) }
end
