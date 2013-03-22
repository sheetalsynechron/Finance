require "spec_helper"

describe CanCan::AccessDenied do

   #  describe "exceptions:" do
   #     before(:each) do
   #     @exception = CanCan::AccessDenied.new("Access denied!")
   #     end
   #     it "rescues from AccessDenied" do
   #     OrganisationController.stub(:authorize_user!) { raise CanCan::AccessDenied }
   #     #expect{:authorize_user!}.to raise_error(CanCan::AccessDenied)
   #     page.should have_content "You are not authorized to access this page."
   #     #expect { raise CanCan::AccessDenied }.to raise_error(CanCan::AccessDenied)
   #      #flash[:error].should == @exception.message
   # end
   #  end

   describe "exceptions" do
  before(:each) do
    request.env["HTTP_REFERER"] = "where_i_came_from"

  end

  describe "GET /index" do
    it "redirects back to the referring page" do
      get :index
      response.should redirect_to "where_i_came_from"
    end
  end
 end
    end

  

  