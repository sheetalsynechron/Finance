class Roles < ActiveRecord::Base
  attr_accessible :role_name
  belongs_to :user
end
