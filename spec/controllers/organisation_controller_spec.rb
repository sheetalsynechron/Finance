require 'spec_helper'
def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      sign_in Factory.create(:admin)
    end
  end


def login_user
    before(:each) do
      @request.env["devise.mapping"] = :user
      @user = Factory.create(:user)
      sign_in @user
    end
  end

describe OrganisationController do
	render_views
  login_user


  describe "GET #index" do

    it "populates an array of organisations" do
    organisation = Factory.build(:organisation)
    get :index
    response.should render_template :index
    #assigns(:organisation).should eq([organisation])
    end

    # it "renders the :index view" do 
    # get :index
    # response.should render_template :index
    # end
  end
end 