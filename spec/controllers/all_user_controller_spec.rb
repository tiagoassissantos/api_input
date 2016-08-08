require 'rails_helper.rb'

RSpec.describe AllUsersController, :type => :controller do

	describe "GET #index" do
		it "should return json with 20 users paginated" do
			get :index
			
			expect( response ).to be_success
		end
	end	

end