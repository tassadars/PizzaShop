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
	@res = @orders.gsub(/[{}:]/,'').split(',').map{|h| h1,h2 = h.split('=>'); {h1 => h2}}.reduce(:merge)

  	erb :cart 
end

get '/contacts' do
  	erb :contacts
end