require_relative 'contacts.rb'

class CRM
  # def initialize(name)
  #   @name = name
  # end

  def print_main_menu
    puts "1. Add a contact"
    puts "2. Modify a contact"
    puts "3. Display all contacts"
    puts "4. Search by attribute"
    puts "5. Display contact attribute"
    puts "6. Delete a contact"
    puts "7. Exit"
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
    when 4 then search_by_attribute
    when 5 then display_attribute
    when 6 then delete_contact
    when 7
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

#3.  Display all contacts
  def display_all
    Contact.all.each do |contact|
      puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"
    end
  end

#6. Delete contact
  def delete_contact
    puts "Which contact by ID number?"
    user_id = gets.chomp.to_i
    Contact.delete(user_id)
  end
end #CRM class

crm = CRM.new
crm.main_menu
