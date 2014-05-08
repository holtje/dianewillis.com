desc 'Used for Travis CI'
task :travis do
  RAILS_ENV = ENV['RAILS_ENV'] = 'test'
  Rake::Task['environment'].invoke
  Rake::Task['db:drop'].invoke
  Rake::Task['db:create'].invoke
  Rake::Task['db:migrate'].execute
  Rake::Task['spec'].invoke
end
