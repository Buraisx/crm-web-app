require_relative 'contact'
require 'sinatra'

get '/' do
	erb :index
end

get '/contacts' do
	@contact_list = Contact.all
	erb :contacts
end

get '/about' do
	erb :about
end
after do
	ActiveRecord::Base.connection.close
end