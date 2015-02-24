BillsApp::Application.routes.draw do

  resources :bills, path: 'wydatki' do
    collection do
      get 'dzis', to: 'bills#today', as: 'today'
      get 'miesiac', to: "bills#month", as: 'month'
    end
  end

  get 'statystyki', to: 'stats#index', as: 'stats'

  devise_for :users
  root to: 'pages#index'

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

end
