Rails.application.routes.draw do
  get 'people', to: "person#index"
  get 'person/:id', to: "person#show"

  get '/', to: 'welcome#home'
  get '/about', to: 'welcome#about'
  get '/credits', to: 'welcome#credits'
  
  get 'tv', to: 'tv#index'
  get 'tv/genres', to: 'tv#genre_list'
  get 'tv/popular', to: 'tv#popular_tv'
  get 'tv/on_the_air', to: 'tv#on_the_air'
  get 'tv/top_rated', to: 'tv#top_rated'
  get 'tv/airing_today', to: 'tv#airing_today'
  get 'tv/:id', to: 'tv#show'
  get 'tv/genre/:id', to: "tv#genre"


  get 'movies', to: 'movies#index'
  get 'movies/genres', to: 'movies#genre_list'
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
end
