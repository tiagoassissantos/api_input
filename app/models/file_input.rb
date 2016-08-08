#encoding: UTF-8
require 'singleton'

class FileInput
	include Singleton

	def initialize
		@file = []
		File.readlines("#{Rails.root}/lib/assets/input").map do |line|
			@file << line.split
		end
	end

	def seek_user( user )
		if user.nil? || user.empty?
			["Não encontrado", "inbox", "0", "size", "0"]

		else
			file = File.new( "#{Rails.root}/lib/assets/input", "r" )
			line = file.grep( /#{user}/ )[0]

			if line.nil?
				["Não encontrado", "inbox", "0", "size", "0"]

			else
				line.split
			end
		end
	end

	def seek_for_greater_size()
		@file.sort_by(&:last).last
	end

	def seek_for_greater_inbox()
		@file.sort_by{|a,b,c,d,e|c}.last
	end

	def all_users()
		@file
	end

end