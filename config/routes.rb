Colorfy::Application.routes.draw do
  resources :boards, :only => [:new, :create, :show, :update]
  root :to => "boards#new"
end
