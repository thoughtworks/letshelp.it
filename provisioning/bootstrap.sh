#!/usr/bin/env bash

apt-get update

apt-get install -y vim curl

apt-get uninstall -y ruby1.9 ruby1.9.1
apt-get install -y ruby1.8 ruby1.8-dev rubygems libsqlite3-dev build-essential nodejs

gem install bundler

pushd /vagrant && bundle install && popd
