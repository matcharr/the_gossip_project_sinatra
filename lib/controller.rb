# frozen_string_literal: true

require 'Gossip'
class ApplicationController < Sinatra::Base
  get '/' do
    erb :index
  end
  get '/gossips/new/' do
    erb :new_gossip
  end
  post '/gossips/new/' do
    Gossip.new.save
  end
end

