require 'rubygems'
require 'sinatra'

Sinatra::Application.set(:run, false)
Sinatra::Application.set(:environment, :development)

require 'application'
run Sinatra::Application