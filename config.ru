require 'rubygems'
require 'sinatra'

Sinatra::Application.set(:run, false)
Sinatra::Application.set(:environment, :development)

require 'myapp'
run Sinatra::Application