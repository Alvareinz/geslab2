Rails.application.routes.draw do
  devise_for :users
  root to: 'welcome#index'

	get 'indexhardware' => 'hardwares#indexhardware'
    get 'indextypes' => 'types#indextypes' 
  	

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
