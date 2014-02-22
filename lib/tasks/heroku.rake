namespace :heroku do
  desc 'Clone the live database for testing'
  task :pull do
    system 'dropdb dianewillis-devel'
    system 'heroku pg:pull DATABASE_URL dianewillis-devel'
  end

  desc 'Deploy the git repository to heroku'
  task :deploy do
    system 'git push git@heroku.com:dianewillis.git master'
    system 'heroku run rake db:migrate'
  end
end
