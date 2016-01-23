require 'active_record'
require 'mini_record'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'crm-web.sqlite3')


class Contact

  # Attributes that are read-only
  attr_reader :id
  # Attributes that are read and write
  attr_accessor :first_name, :last_name, :email, :note

  # Contact class variables available:
  @@contacts = [] # <= Array containing all contacts
  @@id = 1 # <= Unique id number will be assigned to each contact

  def initialize(first_name, last_name, email, note)
    # Define variables to be created upon creation of new contact
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1
  end

  def self.create(first_name, last_name, email, note)
    # Class method that can create a new contact
    new_contact = Contact.new(first_name, last_name, email, note)
    @@contacts << new_contact
    new_contact
  end

  def self.all
    # Display all contacts in the list
    @@contacts
  end

  def self.get(id)
    # Retrieve a contact from the list using the id attribute
    @@contacts.find { |contact| contact.id == id }
  end

  def self.search_by_attribute(name, value)
    # Return a list of contacts where the specific type of contact info
    # matches the piece of contact info given. E.g. first_name, "Karen"
    @@contacts.select do |contact|
      if ( "first_name" == name ) && contact.first_name.include?(value)
        contact
      elsif ( "last_name" == name ) && contact.last_name.include?(value)
        contact
      elsif ( "email" == name ) && contact.email.include?(value)
        contact
      elsif ( "note" == name ) && contact.note.include?(value)
        contact
      else
      end
    end
  end

  def self.delete_all
    # Delete all contacts in the list and reset id counter to 1
    @@contacts = []
    @@id = 1
  end

  def full_name
    # Add first name and last name together to get contact's full name
    "#{first_name.capitalize} #{last_name.capitalize}"
  end

  def update(attribute, value)
    # Update whichever attribute has been specified with the given value
    case attribute
    when "first_name"
      @first_name = value
    when "last_name"
      @last_name = value
    when "email"
      @email = value
    when "note"
      @note = value
    else
    end
  end

  def delete
    # Delete the current contact
    @@contacts.delete_if{ |contact| contact.id == id }
  end

end
