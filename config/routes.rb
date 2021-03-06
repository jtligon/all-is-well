Rails.application.routes.draw do

  get '/client/profile' => 'clients#c_profile', as: 'client_profile'

  put '/client/profile', to: 'clients#update', as: 'update_client'

  get 'client/entries' => 'entries#entries_index', as: 'entries_index'

  post 'client/entries' => 'entries#create', as: 'create_entry'

  get 'client/events' => 'events#events_index', as: 'events_index'

  post 'client/events' => 'events#create', as: 'create_event'

  get 'client/event/complete' => 'events#event_complete', as: 'event_complete'

  get 'client/surveys' => 'surveys#surveys_index', as: 'surveys_index'

  post 'client/surveys' => 'surveys#create', as: 'create_survey'

  get 'client/survey_complete' => 'surveys#survey_complete', as: 'survey_complete'

  get 'client/notes' => 'notes#client_notes_index', as: 'c_notes_index'

  get '/therapist/profile' => 'therapists#t_profile', as: 't_profile'

  put '/therapist/profile/:id', to: 'therapists#update', as: 'update_therapist'


# Create a new note
  get 'therapist/note/:id' => 'notes#notes_index', as: 'notes_index'

  post 'therapist/c_profile/:id' => 'notes#create', as: 'create_note'

  get 'client/new'

  get 'client' => 'clients#index', as: 'client_index'



  post 'client' => 'clients#new', as: 'new_client'

  get 'register' => 'registrations#new', as: 'register_user'

  post 'register' => 'registrations#new'

  get '/index' => 'registrations#index'

  authenticated :user, lambda { |u| u.userable_type == 'Client' } do
    root :to => 'clients#index'
  end

  authenticated :user, lambda { |u| u.userable_type == 'Therapist' } do
    root :to => 'therapists#index'
  end

  devise_scope :user do
    get '/', to: 'devise/sessions#new', as: 'sign_in'
  end

  get 'therapist' => 'therapists#index'

  post 'therapist' => 'therapists#new', as: 'new_therapist'

# Client calendar, id is client id
  get 'therapist/calendar/:id'  => 'therapists#calendar', as: 'client_calendar'


  get 'calendar/json/:id' => 'therapists#render_events'

# A client's posts and surveys, id is client id
  get 'therapist/activity/:id'  => 'therapists#activity', as: 'client_activity'

  put 'therapist/update_read'  => 'therapists#update_read', as: 'activity_read'

# Client profile, id is client's id
  get 'therapist/c_profile/:id' => 'therapists#c_profile', as: 'c_profile'

  devise_for :users
end
