require 'sinatra/base'
require_relative './lib/peep'

# this is the class comment - the main project class. 
class Chitter < Sinatra::Base
  # the hompage redirects to view all the peeps. 
  get '/' do
    redirect '/peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    Peep.create(peep: params[:peep], date: params[:date])
    redirect '/peeps'
  end

  run! if app_file == $0
end
