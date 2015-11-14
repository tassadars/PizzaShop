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
	#How to fix it? To receive table with info.
	erb "Please click on Cart button to continue"
end 

post '/cart' do
	@orders_input = params[:orders]
	@items = parse_orders_input @orders_input

	# id, cnt - in array. We will replace id by full record from DB
	@items.each do |item|
		item[0] = Product.find(item[0])
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

def parse_orders_input orders_input
	s1 = orders_input.split(/,/)
	arr = []

	s1.each do |x|
		s2 = x.split(/\=>/)
		s3 = s2[0].split(/_/)

		key = s3[1]
		value = s2[1]

		arr2 = [key, value]
		arr.push arr2	                                                       
	end
	return arr
end
