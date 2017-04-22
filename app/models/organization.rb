class Organization < ActiveRecord::Base
  enum org_type: %i(show_room service dealer)
  enum pricing_policy: %i(flexible fixed prestige)
end
