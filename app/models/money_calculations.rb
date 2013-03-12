class MoneyCalculations < ActiveRecord::Base
  attr_accessible :calculation_amount, :organisation_id
  belongs_to :organisation
end
