require_relative 'contact'
require 'sinatra'

get '/' do
	@contact_list = Contact.all()
	erb :index
end

get '/contacts/new' do
	erb :new	
end
# POST HANDLER FOR MAKING NEW CONTACT
post '/contacts' do
	  Contact.create(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
  )
	  redirect to('/')
end
# SHOW CONTACTS
get '/contacts/:id' do
	@contact = Contact.find_by(id: params[:id].to_i)
	puts @contact.id
	if @contact
		erb :show_contact
	else
		raise Sinatra::NotFound
	end
	
end

get '/contacts/:id/edit' do
	@contact = Contact.find_by(id: params[:id].to_i)
	if @contact
		erb :edit_contact
	else
		raise Sinatra::NotFound
	end
end
# PUT REQUEST HANDLER FOR EDITING, NEED HIDDEN FIELD
put '/contacts/:id' do
	@contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    @contact.update(
    first_name: params[:first_name],
    last_name:  params[:last_name],
    email:      params[:email],
    note:       params[:note]
    )

    redirect to('/')
  else
    raise Sinatra::NotFound
  end
end

# DELETE REQUEST HANDLER
delete '/contacts/:id' do
  @contact = Contact.find_by(id: params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/')
  else
    raise Sinatra::NotFound
  end
end

get '/about' do
	erb :about
end



after do
	ActiveRecord::Base.connection.close
end