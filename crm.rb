require_relative 'contact'
require 'sinatra'

get '/' do
	@contact_list = Contact.all()
	erb :index
end

get '/contacts/:id' do
	@contact = Contact.find_by(params[:id].to_i)
	erb :show_contact
end

get '/about' do
	erb :about
end

after do
	ActiveRecord::Base.connection.close
end