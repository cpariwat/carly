# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

organizations = Fabricate.times(5, :organization)
models = Fabricate.times(10, :model, organization: organizations.sample)
model_types = Fabricate.times(30, :model_type, model: models.sample)