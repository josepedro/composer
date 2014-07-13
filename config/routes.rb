PaperclipDemo::Application.routes.draw do
  get 'download/index'

  get 'download/pdf'

  resources :friends
  root :to => 'friends#index'
end
