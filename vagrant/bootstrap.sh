#!/usr/bin/env bash

sudo apt -y update
sudo apt-get -y install ansible=2.0.0.2-2ubuntu1.3

export DEBIAN_FRONTEND="noninteractive"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password password root"
sudo debconf-set-selections <<< "mysql-server mysql-server/root_password_again password root"
sudo apt-get -y update
sudo apt-get -y install libmysqlclient-dev nodejs nginx mysql-server
sudo systemctl start mysql
sudo systemctl status mysql

gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3 7D2BAF1CF37B13E2069D6956105BD0E739499BDB
cd /tmp && curl -sSL https://get.rvm.io -o rvm.sh && cat /tmp/rvm.sh | bash -s stable --rails
source /usr/local/rvm/scripts/rvm
rvm install 2.3.0
rvm use 2.3.0 --default
#ruby -v

gem uninstall -i /usr/local/rvm/gems/ruby-2.3.0@global bundler
gem install bundler -v 1.9
cd /vagrant/
bundle install

RACK_ENV=development RAILS_ENV=development rake assets:precompile
RACK_ENV=development RAILS_ENV=development rake db:create
RACK_ENV=development RAILS_ENV=development rake db:migrate
RACK_ENV=development RAILS_ENV=development bundle exec puma


