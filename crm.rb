require_relative 'contact'
require 'sinatra'

get '/' do
	@contact_list = Contact.all()
	erb :index
end

get '/contacts/:id' do
	erb :show_contact
end

get '/about' do
	erb :about
end

after do
	ActiveRecord::Base.connection.close
end