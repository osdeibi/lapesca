Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  get '/galeria', to: 'pages#gallery', as: 'gallery'

  get '/hoteles/la_pescalinda', to: 'hotels#la_pescalinda', as: 'la_pescalinda'
  get '/hoteles/tropicana', to: 'hotels#tropicana', as: 'tropicana'
  get '/hoteles/palma_real', to: 'hotels#palma_real', as: 'palma_real'
  get '/hoteles/riviera_del_rio', to: 'hotels#riviera_del_rio', as: 'riviera_del_rio'
  get '/hoteles/nuevo_amanecer', to: 'hotels#nuevo_amanecer', as: 'nuevo_amanecer'
  get '/hoteles/marina_del_rio', to: 'hotels#marina_del_rio', as: 'marina_del_rio'
  get '/hoteles/la_escollera', to: 'hotels#la_escollera', as: 'la_escollera'
  get '/hoteles/hotel_blanquita', to: 'hotels#hotel_blanquita', as: 'hotel_blanquita'
  get '/hoteles/villa_del_mar', to: 'hotels#villa_del_mar', as: 'villa_del_mar'
  get '/hoteles/punta_piedra', to: 'hotels#punta_piedra', as: 'punta_piedra'
  get '/hoteles/maria_esperanza', to: 'hotels#maria_esperanza', as: 'maria_esperanza'

  resources :hotels, :path => "hoteles-lapesca-tamaulipas" do
    member do
      get 'reservar'
    end
  end

  resources :reservations

  get '/puerto_la_pesca', to: 'pages#puerto_la_pesca', as: 'puerto_la_pesca'
  get '/privacidad', to: 'pages#privacy', as: 'privacy'
  get '/acerca', to: 'pages#about', as: 'about'
  get '/faqs', to: 'pages#faqs', as: 'faqs'
  get '/terminos', to: 'pages#terms', as: 'terms'
  get '/quienes_somos', to: 'pages#about_us', as: 'about_us'
  get '/como_llegar', to: 'pages#map', as: 'map'
  get '/pesca_en_lancha-lapescatamaulipas', to: 'pages#pesca_en_lancha', as: 'pesca_en_lancha'
  get '/paseo_en_lancha', to: 'pages#paseo_en_lancha', as: 'paseo_en_lancha'
  get '/renta_de_kayaks', to: 'pages#renta_de_kayaks', as: 'renta_de_kayaks'
  get '/tortuga_lora-lapescatamaulipas', to: 'pages#tortuga_lora', as: 'tortuga_lora'
  get '/tu_reservacion', to: 'pages#thank_you', as: 'thank_you'

  get '/dashboard', to: 'dashboard#index', as: 'dashboard_index'
  get '/dashboard/calendar/:id', to: 'dashboard#calendar', as: 'calendar'
  get '/dashboard/clear_calendar/:id/:calendar_date_id', to: 'dashboard#clear_calendar_date', as: 'clear_calendar_date'
  get '/dashboard/fill_calendar/:id', to: 'dashboard#fill_calendar_date', as: 'fill_calendar_date'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
