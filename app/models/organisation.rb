class Organisation < ActiveRecord::Base

belongs_to :user,:dependent => :destroy
has_many :money_calculation
attr_accessible :name,:user_id,:amount,:first_name,:image ,:user_attributes
mount_uploader :image, ImageUploader
accepts_nested_attributes_for :user
end
