require 'sinatra'
require_relative 'contact.rb'

#TEMP id
Contact.create('Johnny','Bravo', 'johnny@bitmakerlabs.com', 'Rockstar')
Contact.create('Tamara','Stefanovic','stefanov.tamara@gmail.com', 'Admin')

get '/' do
  @crm_app_name = "Tamara's CRM"
  erb :index
end

get '/contacts' do
  erb :contacts
end

get '/contacts/new_contact' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end

get '/contacts/:id' do
  @contact = Contact.get(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get 'contacts/:id/edit' do
  @@contact = Contact.get(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end
