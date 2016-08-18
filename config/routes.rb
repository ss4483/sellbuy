Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'

# post
  get 'posts/index'
    # post CRUD
  post '/post_write' => 'posts#post_write'
  get '/post_delete/:post_id' => 'posts#post_delete'
  post '/post_update/:post_id' => 'posts#post_update'
  get '/searches' => 'posts#searches'
    # reply CRUD
  post '/post_reply' => 'posts#post_reply'
  get '/reply_delete' => 'posts#reply_delete'
  post '/reply_update' => 'posts#reply_update'
    # post 좋아요
  post '/post_like' => 'posts#post_like'
#flea
    # flea CRUD
  get '/flea_enroll_view' => 'flea#flea_enroll_view'
  post '/flea_enroll' => 'flea#flea_enroll'
  get '/flea_delete/:flea_id' => 'flea#flea_delete'
  get '/flea_update_view/:flea_id' => 'flea#flea_update_view'
  post '/flea_update/:flea_id' => 'flea#flea_update'
  get '/flea_info/:flea_id'  => 'flea#flea_info'
  get '/past_flea' => 'flea#past_flea'
#user_page
  get '/user_page/:user_id' => 'user_page#user_page'
  # 즐겨찾기
  get '/user_favorite/:user_id'=> 'user_page#user_favorite'
  # 후기 CRUD
  post '/epilogue/:user_id' => 'user_page#epilogue'
  get '/epilogue_delete/:epilogue_id' => 'user_page#epilogue_delete'
  post '/epilogue_update/:epilogue_id' => 'user_page#epilogue_update'
  get '/epilogue_check/:epilogue_id' => 'user_page#epilogue_check'
  # 좋아요 글
  get '/like_post' => 'user_page#like_post'

  get '/user_list' => 'user_page#user_list'
# services
  get '/about_us' => 'services#about_us'
  get '/services' => 'services#services'
  get '/service_write_view' => 'services#service_write_view'
  post '/service_write' => 'services#service_write'
  get '/service_info/:service_id' => 'services#service_info'
  get '/service_delete/:service_id' => 'services#service_delete'
  get '/service_update_view/:service_id' => 'services#service_update_view'
  post '/service_update/:service_id' => 'services#service_update'
    # reply CRUD
    post '/service_reply/:service_id' => 'services#service_reply'
    get '/service_reply_delete/:re_id' => 'services#service_reply_delete'
    post '/service_reply_update/:re_id' => 'services#service_reply_update'

post'/services/same_nickname'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

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
