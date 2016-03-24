<<<<<<< HEAD
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
=======
require_relative 'contacts.rb'

class CRM
  def self.run
      crm = CRM.new
      crm.main_menu
  end

  def print_main_menu
    puts "1. Add a contact"
    puts "2. Modify a contact"
    puts "3. Display all contacts"
    puts "4. Search by attribute"
    puts "5. Delete a contact"
    puts "6. Exit"
  end #print_main_menu

  def main_menu
    choice = 0
    while true
    print_main_menu
    choice = gets.chomp.to_i
    choose_option(choice)
  end #while
end

  def choose_option(choice)
    case choice
      when 1 then add_contact
      when 2 then modify_contact
      when 3 then display_all
      when 4 then search_contact
      when 5 then delete_contact
      when 6
        puts "Thanks for playing"
        exit
    else
       puts "nope"
    end#case choice
  end#choose_option

#1. Add a contact
  def add_contact
    puts "First Name"
    first_name = gets.chomp.to_s
    puts "Last Name"
    last_name = gets.chomp.to_s
    puts "Email"
    email = gets.chomp.to_s
    puts "Note"
    note = gets.chomp.to_s
    new_contact = Contact.create(first_name, last_name, email: email, note: note)
  end #add_contact

  def modify_contact
    puts "Who do you want to modify (ID number)"
    id_num = gets.chomp.to_i
    contact = Contact.get(id_num)
    puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"

    puts "What do you want to change?"
    puts "1. First Name"
    puts "2. Last Name"
    puts "3. Email Address"
    puts "4. Note"
    puts "5. exit"

    update_options = gets.chomp.to_i
        case update_options
        when 1
          puts "New first name:"
          contact.first_name = gets.chomp.to_s
          puts "New first name = #{contact.first_name.capitalize}"
        when 2
          puts "New last name:"
          contact.last_name = gets.chomp.to_s
          puts "New first name = #{contact.last_name.capitalize}"
        when 3
          puts "New email address:"
          contact.email = gets.chomp.to_s
          puts "New email address = #{contact.email}"
        when 4
          puts "New note:"
          contact.note = gets.chomp.to_s
          puts "Note = #{contact.note}"
        when 5
          exit
        else
          puts "That's not an option, dummy"
        end
    end




# def modify_contact
#   puts "what id to mod"
#   id_num = gets.chomp.to_i
#
#   modify_contact = Contact.get(id_num)
#
#   puts "what do you wanna mod"
#   mod = gets.chomp
#   puts "what new"
#   mod_new = gets.chomp
#
#   modify_contact.update(mod, mod_new)
#
# end

#3.  Display all contacts
  def display_all
    Contact.all.each do |contact|
      puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"
    end
  end

#4 Search by attribute
  def search_contact
    puts "Whom do you seek?"
    value = gets.chomp.to_s
    Contact.search_by_attribute(value)
  end

#5. Delete contact
  def delete_contact
    puts "Which contact by ID number?"
    user_id = gets.chomp.to_i
    Contact.delete(user_id)
  end
end #CRM class

CRM.run
>>>>>>> 96405b191e2a1fed2123651c1d4ec10573af8682
