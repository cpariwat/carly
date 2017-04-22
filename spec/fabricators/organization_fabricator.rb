Fabricator(:organization) do
  name           { FFaker::Company.name }
  public_name    { "#{FFaker::Company.name} #{FFaker::Company.suffix}" }
  org_type       { Organization.org_types.values.sample }
  pricing_policy { Organization.pricing_policies.values.sample }
end
