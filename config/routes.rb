# encoding: UTF-8

class PageKeyConstraint
  def matches?(request)
    if Rails.env.test? and request.params[:key].nil?
      # When running as specs, request.params doesn't work right.
      request.params[:key] = request.env["PATH_INFO"].sub '/', ''
    end
    Page.find_by_key(request.params[:key])
  end
end

Dianewillis::Application.routes.draw do
  # The priority is based upon order of creation:
  # first created -> highest priority.

  Mercury::Engine.routes

  root :to => 'page#show', :key => 'root'
  get "login" => "sessions#new", :as => "login"
  get "logout" => "sessions#destroy", :as => "logout"

  resources :sessions

  resources :page, :only => [:mercury_update, :show] do
    member { post :mercury_update }
  end

  controller :page do
    constraints PageKeyConstraint.new do
      get '/:key',  :to => :show, :as => :page, :key => /.*/
    end
  end
end
