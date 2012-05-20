Memori::Application.routes.draw do
  root to: "welcome#index"
  resources :decks, only: [:index, :show]
  get "study/:id" => "study#show", as: :study_deck
  resources :card_records, only: [:update]
  resources :cards, only: [:show]
end
