# Gym Management

Installations:

Clone the repository:
  git clone https://github.com/Tramchandani/gym-management-system.git
  cd gym-management-system

Check your ruby version:
  ruby -v

  If it outputs something like ruby 3.0.0 then ruby is already installed. If not install ruby using rbenv like:
    rbenv install 3.0.0

Install dependencies
  yarn

Set Environment variables using figaro:
  add gem 'figaro' in gemfile if not present
  then run 'bundle exec figaro install'
  add the appropriate username and password in application.yml file

Initialize the database:
  run 'rails db:create'
  then, 'rails db:migrate'

Start the rails server:
  rails s

Now you can visit the website with the URL http://127.0.0.1:3000

Heroku App URL:
  You can checkout the website through the following link:
  https://shielded-cliffs-43176.herokuapp.com/

