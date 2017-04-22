Fabricator(:organization) do
  name           FFaker::Company.name
  public_name    "#{FFaker::Company.name} #{FFaker::Company.suffix}"
  org_type       1
  pricing_policy 1
end
