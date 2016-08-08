require 'rails_helper.rb'

RSpec.describe FileInputController, :type => :controller do
	describe "GET #search" do
		it "should return json with specific user" do
			get :search, :params => { :user => '_vafyde@uol.com.br' }
			
			expect( response ).to be_success
			expect( response.body ).to eq( "{\"user\":\"_vafyde@uol.com.br\",\"inbox\":12335075,\"size\":10040056}" )
		end

		it "should return json empty if user not found" do
			get :search, :params => { :user => 'tstos.82@gmail.com' }
			
			expect(response).to be_ok
			expect( response.body ).to eq( "{\"user\":\"Não encontrado\",\"inbox\":0,\"size\":0}" )
		end
	end

	describe "GET #greater_size" do
		it "should return json with greater size" do
			get :greater_size
			
			expect(response).to be_ok
			expect( response.body ).to eq( "{\"user\":\"juvati_be@uol.com.br\",\"inbox\":232478,\"size\":12345671}" )
		end
	end

	describe " GET #greater_inox" do
		it "should return json with greater inbox" do
			get :greater_inbox
			
			expect(response).to be_ok
			expect( response.body ).to eq( "{\"user\":\"jobenapad@uol.com.br\",\"inbox\":12345678,\"size\":12135233}" )
		end
	end
end