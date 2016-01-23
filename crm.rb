require 'sinatra'
require_relative 'contact.rb'

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
  contact = Contact.create(
  first_name:  params[:first_name],
  last_name:   params[:last_name],
  email:       params[:email],
  note:        params[:note]
  )
  redirect to('/contacts')
end

get '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :show_contact
  else
    raise Sinatra::NotFound
  end
end

get '/contacts/:id/edit_contact' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    erb :edit_contact
  else
    raise Sinatra::NotFound
  end
end

put '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.first_name = params[:first_name]
    @contact.last_name = params[:last_name]
    @contact.email = params[:email]
    @contact.note = params[:note]

    @contact.save
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end

delete '/contacts/:id' do
  @contact = Contact.find(params[:id].to_i)
  if @contact
    @contact.delete
    redirect to('/contacts')
  else
    raise Sinatra::NotFound
  end
end
