class Organisation < ActiveRecord::Base


  attr_accessible :name,:user_id,:amount
  belongs_to :user
  has_many :money_calculation



end
