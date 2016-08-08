require 'json'
require 'file_input'

class FileInputController < ApplicationController
  def search
  	file = FileInput.instance
		account = file.seek_user params['user']
		
		render :json => { :user => account[0], :inbox => account[2].to_i, :size => account[4].to_i }.to_json
  end

  def greater_size
  	file = FileInput.instance
		account = file.seek_for_greater_size

		render :json => { :user => account[0], :inbox => account[2].to_i, :size => account[4].to_i }.to_json
  end

  def greater_inbox
  	file = FileInput.instance
		account = file.seek_for_greater_inbox

		render :json => { :user => account[0], :inbox => account[2].to_i, :size => account[4].to_i }.to_json
  end
end
