Rails.application.routes.draw do
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  root 'pages#home'

  get '/galeria', to: 'pages#gallery', as: 'gallery'
  get '/galeria/detalle', to: 'pages#gallery_detail', as: 'gallery_detail'

  get '/hotel-lapescalinda', to: 'hotels#la_pescalinda', as: 'la_pescalinda'
  get '/bungalows-tropicana', to: 'hotels#tropicana', as: 'tropicana'
  get '/hotel-palma-real', to: 'hotels#palma_real', as: 'palma_real'
  # get '/hotel-riviera-del-rio', to: 'hotels#riviera_del_rio', as: 'riviera_del_rio'
  # get '/nuevo-amanecer', to: 'hotels#nuevo_amanecer', as: 'nuevo_amanecer'
  get '/hotel-marina-del-rio', to: 'hotels#marina_del_rio', as: 'marina_del_rio'
  get '/hotel-la-escollera', to: 'hotels#la_escollera', as: 'la_escollera'
  get '/hotel-blanquita', to: 'hotels#hotel_blanquita', as: 'hotel_blanquita'
  # get '/hotel-villa-del-mar', to: 'hotels#villa_del_mar', as: 'villa_del_mar'
  get '/hotel-punta-piedra-bungalows', to: 'hotels#punta_piedra', as: 'punta_piedra'
  # get '/hotel-maria-esperanza', to: 'hotels#maria_esperanza', as: 'maria_esperanza'
  get '/hotel-villa-del-sol', to: 'hotels#villa_del_sol', as: 'villa_del_sol'
  get '/casa-blanca', to: 'hotels#casa_blanca', as: 'casablanca'
  get '/casa-rustica', to: 'hotels#casa_rustica', as: 'casa_rustica'
  get '/casita-pesca', to: 'hotels#casita_pesca', as: 'casita_pesca'

  resources :hotels, :path => "hotelesenlapesca" do
    member do
      get 'reservar'
    end
  end

  namespace :dashboard do
    resources :hotels
    resources :rooms
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
  get '/el_sabinito', to: 'pages#el_sabinito', as: 'el_sabinito'
  get '/clima', to: 'pages#weather', as: 'weather'

  post '/contacto', to: 'reservations#contacto'

  get '/dashboard', to: 'dashboard#reservations', as: 'dashboard_index'
  get '/dashboard/calendar/:id', to: 'dashboard#calendar', as: 'calendar'
  get '/dashboard/clear_calendar/:id/:calendar_date_id', to: 'dashboard#clear_calendar_date', as: 'clear_calendar_date'
  get '/dashboard/fill_calendar/:id', to: 'dashboard#fill_calendar_date', as: 'fill_calendar_date'

  get '/dashboard/reservations', to: 'dashboard#reservations', as: 'dashboard_reservations'
  get '/dashboard/reservations/edit', to: 'reservations#show', as: 'dashboard_edit_reservation'
  get '/dashboard/confirm/:id', to: 'dashboard#confirm', as: 'confirm_reservation'

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
