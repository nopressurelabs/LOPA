Rails.application.routes.draw do
  root 'act#index'
  get 'action/stop-lopa-2015', to: 'take_action#stop_lopa'
  get 'action/stop-lopa-2015/count-actions', to: 'take_action#count_actions'
  get 'action/stop-lopa-2015/last-actions', to: 'take_action#last_actions'

  resources :take_action, only: [:create]
end
