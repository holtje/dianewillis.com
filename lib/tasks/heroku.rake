namespace :heroku do
  desc "Clone the live database for testing"
  task :pull do
    system "heroku db:pull --confirm dianewillis"
  end

  desc "Deploy the git repository to heroku"
  task :deploy do
    system "git push git@heroku.com:dianewillis.git master"
    system "heroku run rake db:migrate db:seed"
  end
end