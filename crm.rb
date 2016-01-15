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

#   def print_modify_menu
#     puts "What would you like to change?"
#     puts "1: First Name"
#     puts "2: Last Name"
#     puts "3: Email address"
#     puts "4: Note"
#     puts "5: Go back"
#   end
#
#   def modify_menu
#     option = 0
#     while true
#       print_modify_menu
#       option = gets.chomp.to_i
#       choose_option(option)
#     end #while
#   end
#
# #2. Modify Contact
#   def modify_contact
#     #ask for ID
#     puts "Enter contact ID"
#     id_num = gets.chomp.to_i
#     #find contact by ID
#     Contact.get(id_num)
# #prompt user for attribute to edit
#         case choice
#         when 1 then Contact.update
#             when 2 then
#             when 3 then
#             when 4
#             when 5
#                 exit
# else
#    puts "nope"
# end#case choice
# #change attribute
#
# #print new
#   end

def modify_contact
  puts "what id to mod"
  id_num = gets.chomp.to_i

  modify_contact = Contact.get(id_num)

  puts "what do you wanna mod"
  mod = gets.chomp
  puts "what new"
  mod_new = gets.chomp

  modify_contact.update(mod, mod_new)

end

#3.  Display all contacts
  def display_all
    Contact.all.each do |contact|
      puts "#{contact.id} #{contact.full_name} #{contact.email} #{contact.note}"
    end
  end

#4 Search by attribute
  def search_contact
    puts "Whom do you seek?"
    search = gets.chomp.to_s
    Contact.search_by_attribute(search)
  end

#5. Delete contact
  def delete_contact
    puts "Which contact by ID number?"
    user_id = gets.chomp.to_i
    Contact.delete(user_id)
  end
end #CRM class

CRM.run
