Rails.application.routes.draw do
  resources :tasks

  patch "tasks/:id/done", to: "tasks#mark_as_done", as: "mark"
end
