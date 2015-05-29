Rails.application.routes.draw do

  get 'about'=> 'pages#about', as: :about
  get 'help'=> 'pages#help', as: :help
  
  get 'manufacturers' => 'manufacturer#index', as: :manufacturers
  get 'manufacturer/:manufacturer' => 'manufacturer#show', as: :manufacturer
  
  get 'manufacturer/:manufacturer/:model' => 'car#model', as: :model
  get 'manufacturer/:manufacturer/:model/:year' => 'car#year', as: :car
  
  get 'wikipedia/:manufacturer'        => 'wikipedia#manufacturer',  as: :manufacturer_summary
  get 'wikipedia/:manufacturer/:model' => 'wikipedia#model',         as: :model_summary

  root 'pages#home'
end
