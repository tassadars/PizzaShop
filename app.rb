#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'

set :database, "sqlite3:pizzashop.db"


class Product < ActiveRecord::Base
end

get '/' do
	@products = Product.all
	erb :index		
end

get '/about' do
	erb :about		
end

post '/cart' do

	@orders = params[:orders]
	# UNSAFE eval method, DON'T USE ANYMORE
	@res = eval(@orders) #parse string to hash ()

  	erb @res 
end

get '/contacts' do
  	erb :contacts
end