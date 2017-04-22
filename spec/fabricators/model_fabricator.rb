Fabricator(:model) do
  name       { FFaker::Product.brand }
  model_slug { FFaker::Internet.slug(FFaker::Product.brand) }
end
