require 'kaminari'

class AllUsersController < ApplicationController
  def index
  	file = FileInput.instance
		@file_paginated = Kaminari.paginate_array(file.all_users).page(params[:page]).per(20)
  end
end
