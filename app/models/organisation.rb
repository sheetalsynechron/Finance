class Organisation < ActiveRecord::Base


  attr_accessible :name,:user_id,:amount,:id
  belongs_to :user, :dependent => :destroy
  has_many :money_calculation
  attr_accessible :user_attributes
  accepts_nested_attributes_for :user


 
end
