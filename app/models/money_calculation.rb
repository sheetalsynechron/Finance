class MoneyCalculation < ActiveRecord::Base
  attr_accessible :calculation_amount, :organisation_id, :user_id
  belongs_to :organisation
end
