require 'rails_helper'

describe "Open home", :js => true do
	it "ok" do
		visit root_path
		expect(page).to have_content 'User: jobenapad@uol.com.br'
	end

	it "make search not found" do
		visit root_path
		within("#search-user") do
			fill_in "user", :with => 'tstos.82@gmail.com'
		end
		click_button 'Pesquisar'
		expect(page).to have_content 'User: Não encontrado'
	end

	it "make search found" do
		visit root_path
		within("#search-user") do
			fill_in "user", :with => 'sasquelgac@uol.com.br'
		end
		click_button 'Pesquisar'
		expect(page).to have_content 'Inbox: 1033601'
	end
end