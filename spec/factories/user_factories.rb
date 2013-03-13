FactoryGirl.define do
  factory :user do
    
    email "exp@example.com" 
    password              '12345678'
    password_confirmation '12345678'
    created_at            Time.now
    updated_at            Time.now
    role_name			  'superadmin'
    end

    # factory :admin do
    #     #after(:create) {|user| user.role_name(:admin)}
    #     email "exp@example.com" 
    # password              '12345678'
    # password_confirmation '12345678'
    # created_at            Time.now
    # updated_at            Time.now
    # role_name			  'admin'
    # end

    # factory :user1 do
    #     after(:create) {|user| user.add_role(:user1)}
    # end

    # factory :super_admin do
    #     after(:create) {|user| user.add_role(:super_admin)}
    # end
end