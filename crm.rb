require 'sinatra'
require_relative 'contact.rb'

get '/' do
  @crm_app_name = "Tamara's CRM"
  erb :index
end

get '/contacts' do
  Contact.create('Mark', 'Zuckerberg', 'mark@facebook.com', 'Swine')
  Contact.create('Linus', 'Torvalds', 'linus@linux.com', 'genius')
  Contact.create('Steve', 'Jobs', 'steve@apple.com', 'lucky turtleneck?')

  erb :contacts
end

get '/contacts/new' do
  erb :new_contact
end

post '/contacts' do
  Contact.create(params[:first_name], params[:last_name], params[:email], params[:note])
  redirect to('/contacts')
end
