  SocialNw::Application.routes.draw do
  
  get "friends/all_friends"
  get "home/index"
  match "users/edit_profile/:id" => "users#edit_profile", :as => "edit_profile"
  match "friends/mutual/:id"=>"friends#mutual",:as=>"mutual_profile"
  match "users/show/:id" => "users#show", :as => "show_profile"
  match "users/change_password/:id" => "users#change_password", :as => "change_password"
  match "users/all_user/:id" => "users#all_user", :as => "all_user"
  match "friends/add_friends/:id" => "friends#add_friends", :as => "add_friends"
  match "friends/all_friends/:id" => "friends#all_friends", :as => "all_friends"
  match "home/like" => "home#like", :as => "home_like"
  match "home/unlike/:id" => "home#unlike", :as => "home_unlike"
  match "home/like_people/:like_id" => "home#like_people", :as => "people"

  match "event/create_event" => "event#create_event", :as=>"create_event"

  match "event/event_list" => "event#event_list", :as=>"event_list"
  match "event/destroy/:id" => "event#destroy"
  match "home/share/:post_id" => "home#share",:as=>"home_share"
  match "home/share_people" => "home#share_people",:as=>"share_people"




    #  match "home/comment/:post_id" =>"home#comment", :as =>"comment"
  #match "users/show" => "users#show"
  #match "home/index" => "home#index"
  devise_for :users

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
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

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
root :to => "home#index"

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
 match ':controller(/:action(/:id))(.:format)'
end
