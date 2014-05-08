# == Route Map (Updated 2014-05-07 23:04)
#
# mercury_engine        /                            Mercury::Engine
#           root GET    /                            page#show {:key=>"root"}
#                PUT    /                            page#update {:key=>"root"}
#          login GET    /login(.:format)             sessions#new
#         logout GET    /logout(.:format)            sessions#destroy
#       sessions GET    /sessions(.:format)          sessions#index
#                POST   /sessions(.:format)          sessions#create
#    new_session GET    /sessions/new(.:format)      sessions#new
#   edit_session GET    /sessions/:id/edit(.:format) sessions#edit
#        session GET    /sessions/:id(.:format)      sessions#show
#                PUT    /sessions/:id(.:format)      sessions#update
#                DELETE /sessions/:id(.:format)      sessions#destroy
#           page GET    /page/:id(.:format)          page#show
#           page GET    /:key(.:format)              page#show {:key=>/.*/}
#
# Routes for Mercury::Engine:
# mercury_editor  /editor(/*requested_uri)(.:format)        mercury#edit
#                 /mercury/:type/:resource(.:format)        mercury#resource
#                 /mercury/snippets/:name/options(.:format) mercury#snippet_options
#                 /mercury/snippets/:name/preview(.:format) mercury#snippet_preview
#

# encoding: UTF-8

# A constraint for pages that are in the DB.
class PageKeyConstraint
  def matches?(request)
    if Rails.env.test? && request.params[:key].nil?
      # When running as specs, request.params doesn't work right.
      request.params[:key] = request.env['PATH_INFO'].sub '/', ''
    end
    Page.find_by_key(request.params[:key])
  end
end

Dianewillis::Application.routes.draw do
  mount Mercury::Engine => '/'

  # The priority is based upon order of creation:
  # first created -> highest priority.

  Mercury::Engine.routes

  root to: 'page#show',   via: [:get], key: 'root'
  match '' => 'page#update', :via => [:put], :key => 'root'
  get 'login' => 'sessions#new', :as => 'login'
  get 'logout' => 'sessions#destroy', :as => 'logout'

  resources :sessions

  resources :page, only: [:show]

  controller :page do
    constraints PageKeyConstraint.new do
      get '/:key',  to: :show, as: :page, key: /.*/
    end
  end
end
