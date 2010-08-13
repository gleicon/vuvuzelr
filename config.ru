require 'rubygems'
require 'sinatra'
set :env,  :production
disable :run

require 'proxy'

run Sinatra::Application
