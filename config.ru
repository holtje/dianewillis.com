require 'rack/static'

use(
  Rack::Static,
  root: 'site',
  urls: %w( /assets /a ),
  index: 'index.html',
  header_rules: [[:all, { 'Cache-Control' => 'public, max-age=1' }]]
)

run lambda { |_env|
  [404,
   { 'Content-Type' => 'text/html' }, ['404 - page not found']
  ]
}
