Rails.application.routes.draw do
  get 'search' => 'file_input#search'

  get 'greater_size' => 'file_input#greater_size'

  get 'greater_inbox' => 'file_input#greater_inbox'

  get 'all_users' => 'all_users#index'

  root 'home#index'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
