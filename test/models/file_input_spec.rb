#ecoding: UTF-8
#require 'file_input'
require 'test_helper'

describe FileInput do
	before do
		@file = FileInput.instance
	end

	it "should seek user" do
		user = "damejoxo@uol.com.br"
		user_line = @file.seek_user( user )
		
		expect( user_line[0] ).to eq( 'damejoxo@uol.com.br' )
	end

	it "should return message user not found" do
		user = "tstos.82@gmail.com"
		user_line = @file.seek_user( user )
		
		expect( user_line[0] ).to eq( 'Não encontrado' )
	end

	it "should return message user not found if user not informed" do
		user = ""
		user_line = @file.seek_user( user )
		
		expect( user_line[0] ).to eq( 'Não encontrado' )
	end

	it "should seek user whith greater size" do
		user_line = @file.seek_for_greater_size
		
		expect( user_line[0] ).to eq( 'juvati_be@uol.com.br' )
	end


	it "should seek user with greater inbox" do
		user_line = @file.seek_for_greater_inbox
		
		expect( user_line[0] ).to eq( 'jobenapad@uol.com.br' )
	end

	it "should return all users" do
		user_line = @file.all_users
		expect( user_line.size ).to eq( 20004 )
	end
end
