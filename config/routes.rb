Rails.application.routes.draw do
  match '/v1/data-items/:type' => 'results#index', :via => :get

  match '(*foo)' => 'fails#four_oh_four', :via => :get
end
