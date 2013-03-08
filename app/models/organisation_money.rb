class OrganisationMoney < ActiveRecord::Base
  attr_accessible :total_amount
  belongs_to :organisation
  has_many :money_calculation
end
