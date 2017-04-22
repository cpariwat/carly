Fabricator(:model_type) do
  name            { FFaker::Product.product_name }
  model_type_slug { FFaker::Internet.slug(FFaker::Product.product_name) }
  model_type_code { FFaker::Product.model }
  base_price      { Random.rand(10_000...100_000) }
end
