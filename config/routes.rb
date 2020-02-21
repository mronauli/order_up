Rails.application.routes.draw do
  get "/dishes/:id", to: "dishes#show"
  get "/chefs/:id", to: "chefs#show"
  get "/chef_ingredients/:chef_id", to: "chef_ingredients#index"
end
