Fabricator(:organization) do
  name           { Faker::Company.name }
  public_name    { "#{Faker::Company.name} #{Faker::Company.suffix}" }
  org_type       { Organization.org_types.values.sample }
  pricing_policy { Organization.pricing_policies.values.sample }
end
