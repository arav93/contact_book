require 'test_helper'

class ContactTest < ActiveSupport::TestCase
  test "Contact should not be saved without email address" do
    contact = Contact.new
    assert_not contact.save
  end

  test "Two contacts should not have the same email address" do
    contact = Contact.create(name: 'Aravind', email:'test@gmail.com', phone: '11111')
    new_contact = Contact.new(name: 'Aravind', email:'test@gmail.com', phone: '11111')
    assert_not new_contact.save
  end
end
