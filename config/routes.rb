Memori::Application.routes.draw do
  root to: "welcome#index"
  resources :decks, only: [:index, :show]
  get "study/:id" => "study#show", as: :study_deck
end
