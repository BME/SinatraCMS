require "classes/helpers"

helpers { include Helpers }

get '/' do
  erb :index
end
