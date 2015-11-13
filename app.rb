#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'logger'

Dir.mkdir('logs') unless File.exist?('logs')
$log = Logger.new('logs/output.log','weekly')

configure :production do
  $log.level = Logger::WARN
end
configure :development do
  $log.level = Logger::DEBUG
end

set :database, "sqlite3:pizzashop.db"

class Product < ActiveRecord::Base
end

class ClientOrder < ActiveRecord::Base
	validates :name, presence: true
	validates :phone, presence: true
	validates :address, presence: true
	validates :list, presence: true
end

get '/' do
	@products = Product.all
	erb :index		
end

get '/about' do
	erb :about		
end

before '/cart' do
	@orders
	@products = Product.all
end

get '/cart' do
	erb :index
end

post '/cart' do
	if params[:orders] != ''
		@orders = params[:orders]
		#$log.debug @orders
	end

	if @orders = @orders.gsub('product_','')
		@res = @orders.gsub(/[{}:]/,'').split(',').map{|h| h1,h2 = h.split('=>'); {h1 => h2}}.reduce(:merge)
	end
  	erb :cart 
end

get '/contacts' do
  	erb :contacts
end




before '/order' do
  @c = ClientOrder.new
end

get '/order' do
  	erb :order
end

post '/order' do
	if params[:orders] != ''
		@orders = params[:orders]
		#$log.debug @orders
	end
	@orders = params[:orders]
  	erb :order
end

post '/confirm' do
	@c = ClientOrder.new params[:client]
	if @c.save
		erb '<h2>Спасибо, ждите доставки!</h2>'
	else
		@error = @c.errors.full_messages.first
		erb :order
	end

  	erb "Wait pizza!!!"
end