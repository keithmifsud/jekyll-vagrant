#!/usr/bin/env sh

###
# Provisioning bootstrap file for VM provided by Keith Mifsud
#
# (c) Keith Mifsud <mifsud.k@gmail.com>
#
# For the full copyright and license information, please view the LICENSE
# file that was distributed with this source code.
#
# Instructions, support and issues: https://github.com/keithmifsud/vagrant-jekyll
##

# Set up variables from arguments for easier management and reference
git_user_name=$1
git_user_email=$2
git_push_default=$3



# Update packages.
apt-get -y update

# Add repository for ruby2.
apt-get -y install python-software-properties
apt-add-repository -y ppa:brightbox/ruby-ng

# Get 2.3 from newly added repository.
apt-get -y update

# Install ruby with build tools so we can use gems
apt-get -y install build-essential
apt-get -y install ruby2.3
apt-get -y install ruby2.3-dev

# Install github pages requirements (jekyll)
sudo gem update --system
sudo gem install github-pages

# Install node.
apt-get -y install nodejs

# Install git.
apt-get -y install git

# Setup git.
git config --global user.name ${git_user_name}
git config --global user.email ${git_user_email}
git config --global push.default ${git_push_default}











