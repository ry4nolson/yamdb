Rails.application.routes.draw do
  get 'people', to: "person#index"
  get 'person/:id', to: "person#show"

  get '/', to: 'welcome#home'
  get '/about', to: 'welcome#about'
  get '/credits', to: 'welcome#credits'
  
  get 'tv', to: 'tv#index'
  get 'tv/popular', to: 'tv#popular_tv'
  get 'tv/on_the_air', to: 'tv#on_the_air'
  get 'tv/top_rated', to: 'tv#top_rated'
  get 'tv/airing_today', to: 'tv#airing_today'
  get 'tv/:id', to: 'tv#show'
  get 'tv/genre/:id', to: "tv#genre"


  get 'movies', to: 'movies#index'
  get 'movies/popular', to: 'movies#popular'
  get 'movies/now_playing', to: 'movies#now_playing'
  get 'movies/top_rated', to: 'movies#top_rated'
  get 'movies/new', to: 'movies#upcoming'
  get 'movies/upcoming', to: 'movies#upcoming'
  get 'movies/:id', to: "movies#show"
  get 'movies/genre/:id', to: "movies#genre"
  
  get 'search/index'
  get '/search', to: "search#index"
  get '/search-autocomplete', to: "search#autocomplete"

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
