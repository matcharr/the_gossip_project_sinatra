# frozen_string_literal: true

require 'Gossip'
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index, locals: {gossips: Gossip.all}
  end
  get '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do
    Gossip.new(params["gossip_author"], params["gossip_content"]).save
    redirect '/'
  end

  get '/gossips/:id' do
		erb :show, locals: {gossip: Gossip.find(params['id']), id: params['id']}
  end
  
  get '/gossips/:id/edit/' do
		erb :edit, locals: {id: params['id']}
	end

	post '/gossips/:id/edit/' do
		gossips = Gossip.all
		Gossip.update(params["gossip_author"], params["gossip_content"], params['id'].to_i)
		redirect '/'
	end
end

