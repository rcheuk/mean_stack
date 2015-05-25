#!/usr/bin/env bash

# install repo for mongodb
sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10
echo "deb http://repo.mongodb.org/apt/ubuntu "$(lsb_release -sc)"/mongodb-org/3.0 multiverse" | sudo tee /etc/apt/sources.list.d/mongodb-org-3.0.list

# update repositories
sudo apt-get update
echo 'Update complete'

# Nodejs installation
sudo apt-get install nodejs npm git -y && sudo ln -s /usr/bin/nodejs /usr/bin/node

sudo echo 'prefix = /home/vagrant/.node' >> /home/vagrant/.npmrc
source /home/vagrant/.npmrc
sudo echo 'PATH="$PATH:$HOME/.node/bin"' >> /home/vagrant/.bashrc
source /home/vagrant/.bashrc
node -v
echo 'Finished installing node'
npm -v
echo 'Finished installing npm'

# install node modules; mean pre-reqs
npm install -g grunt-cli && npm install -g bower
npm install -g gulp
npm install -g yo
echo 'Finished installing node modules'

# install mongodb
sudo apt-get install -y mongodb-org
echo 'Finished installing Mongodb'

# install mean/ currently using fork due to permissions error cited
# in this stackoverflow post: http://stackoverflow.com/questions/29388995/mean-io-installation-on-windows
npm install -g git://github.com/djskinner/mean-cli.git
echo 'Finished install mean'
