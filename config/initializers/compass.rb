require 'fileutils'
FileUtils.mkdir_p(Rails.root.join("tmp", "stylesheets"))

Sass::Plugin.options.merge!(
  :template_location => 'public/stylesheets/sass',
  :css_location => 'tmp/stylesheets'
)

Rails.configuration.middleware.delete('Sass::Plugin::Rack')
Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Sass::Plugin::Rack')

Rails.configuration.middleware.insert_before('Rack::Sendfile', 'Rack::Static',
                                             :urls => ['/stylesheets'],
                                             :root => "#{Rails.root}/tmp")

# heroku = !!ENV['HEROKU_TYPE']
# css_dir = heroku ? 'tmp' : 'public'
# location = Rails.root + 'app/styles'
#
# unless Sass::Plugin.template_location_array.any? { |pair| pair.first.to_s == location.to_s }
#   Sass::Plugin.add_template_location(location, Rails.root + css_dir + 'stylesheets')
# end
#
# if heroku
#   Sass::Plugin.template_location_array.each do |template_location, css_location|
#     css_location.sub!(%r{/public/stylesheets$}, "/#{css_dir}/stylesheets")
#   end
#   Rails.configuration.middleware.insert_after('Sass::Plugin::Rack',
#                                               'Rack::Static',
#                                               :urls => ['/stylesheets'],
#                                               :root => "#{Rails.root}/tmp")
# end
