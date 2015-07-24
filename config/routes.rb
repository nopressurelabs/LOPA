Rails.application.routes.draw do
  root 'act#index'
  get 'action/stop-lopa-2015', to: 'take_action#stop_lopa'

  resources :take_action, only: [:create]
end
