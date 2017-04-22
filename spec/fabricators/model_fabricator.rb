Fabricator(:model) do
  name       FFaker::Product.brand
  model_slug FFaker::Internet.slug(Faker::Product.brand)
end
