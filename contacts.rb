class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  @@contacts = []
  @@id = 1

  def initialize(id, first_name, last_name, options ={})
    @id = @@id
    @first_name = first_name
    @last_name = last_name
    @email = options[:email]
    @note = options[:note]
  end #initialize

  def self.create(first_name, last_name, options ={})
    # 1. create new contact
    # 2. assign new contact a unique ID
      new_contact = new(@@id, first_name,last_name, options) #==Contact.new
    # 3. add new contact to the list
      @@contacts << new_contact
    # 4. Increment the global ID
      @@id += 1
    #5. return the newly created contact
      new_contact
    end #self.create

  def self.find(id)
      @@contacts.find { |contact| contact.id == id}
  end#self.find

  def self.search_by_attribute
    @@contacts.find { |name, value| full_name}
  end

  def self.all
    return @@contacts
  end

  def self.delete(user_id)
    @@contacts.delete_if { |contact| contact.id == user_id}
  end


  def full_name
    "#{first_name} #{last_name}"
  end

  #def self.get(first_name, last_name)
  #  @@contacts.get {|contact| contact.}

  # def first_name
  #   @first_name
  # end
  #
  # def first_name=(new_first_name)
  #   @first_name = new_first_name
  # end


end #class Contact
