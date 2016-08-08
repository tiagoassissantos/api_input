require_relative 'spec_helper.rb'
require_relative '../app/main'

describe Main do
	
	it "should return json with greater inbox" do
		get '/greater_inbox'
		
		expect(last_response).to be_ok

		response = JSON.parse( last_response.body )

		expect( response["user"] ).to eq( 'jobenapad@uol.com.br' )
		expect( last_response.body ).to eq( "{\"user\":\"jobenapad@uol.com.br\",\"inbox\":12345678,\"size\":12135233}" )
	end

	it "should return json with greater size" do
		get '/greater_size'
		
		expect(last_response).to be_ok

		response = JSON.parse( last_response.body )
		expect( response["user"] ).to eq( 'juvati_be@uol.com.br' )
		expect( last_response.body ).to eq( "{\"user\":\"juvati_be@uol.com.br\",\"inbox\":232478,\"size\":12345671}" )
	end

	it "should return json with specific user" do
		get '/search?user=_vafyde@uol.com.br'
		
		expect(last_response).to be_ok

		response = JSON.parse( last_response.body )
		expect( response["user"] ).to eq( '_vafyde@uol.com.br' )
		expect( last_response.body ).to eq( "{\"user\":\"_vafyde@uol.com.br\",\"inbox\":12335075,\"size\":10040056}" )
	end

	it "should return json empty if user not found" do
		get '/search?user=tstos.82@gmail.com'
		
		expect(last_response).to be_ok

		response = JSON.parse( last_response.body )
		expect( response["user"] ).to eq( 'Não encontrado' )
		expect( last_response.body ).to eq( "{\"user\":\"Não encontrado\",\"inbox\":0,\"size\":0}" )
	end

	
end