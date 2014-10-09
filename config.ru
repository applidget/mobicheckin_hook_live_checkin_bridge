require 'rubygems'
require 'bundler'
require './server'
$stdout.sync = true
Bundler.require
run Sinatra::Application
