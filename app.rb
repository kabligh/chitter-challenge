require 'sinatra/base'
require './lib/peep'
require './database_connection_setup'

class Chitter < Sinatra::Base
  get '/' do
    @peeps = Peep.all
    erb(:'index')
  end

  post '/' do
    Peep.create(post: params[:peep])
    redirect('/')
  end

  run! if app_file == $0
end