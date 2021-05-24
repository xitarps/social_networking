require 'rails_helper'

RSpec.describe Admin, type: :model do
  context 'register' do
    it 'is valid' do
      admin = Admin.new(email:'admin@tester.com', password: '123456')

      expect(admin).to be_valid
    end
    it 'not valid - short password' do
      admin = Admin.new(email:'admin@tester.com', password: '12345')

      expect(admin).to_not be_valid
    end
    it 'not valid - not email' do
      admin = Admin.new(email:'admin', password: '123456')

      expect(admin).to_not be_valid
    end
    it 'not valid - already registered' do
      admin = Admin.create(email:'admin@tester.com', password: '123456')
      admin_copy = admin.dup

      expect(admin_copy).to_not be_valid
    end
  end
end
