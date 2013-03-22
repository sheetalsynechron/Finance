FactoryGirl.define do
  factory :user do
    
    email "exp@example.com" 
    password              '12345678'
    password_confirmation '12345678'
    created_at            Time.now
    updated_at            Time.now
    role_name			  'user'
    end

   factory :superadmin, :parent => :user do
    
    email "exp@example.com" 
    password              '12345678'
    password_confirmation '12345678'
    created_at            Time.now
    updated_at            Time.now
    role_name             'superadmin'
    end

    factory :admin, :parent => :user do
        
    id                      1                  
    email "exp@example.com" 
    password              '12345678'
    password_confirmation '12345678'
    created_at            Time.now
    updated_at            Time.now
    role_name             'admin'
    end
end