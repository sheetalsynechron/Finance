class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  
  has_and_belongs_to_many :Roles
  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me ,:role_name,:id,:first_name,:last_name
  # attr_accessible :title, :body

  ROLES =%w[superadmin admin user]

  def role?(role)
    role_name.include?(role.to_s)
  end


end
