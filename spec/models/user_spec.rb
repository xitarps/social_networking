require 'rails_helper'

RSpec.describe User, type: :model do
  context 'register' do
    it 'is valid' do
      user = User.new(name: 'Sr User', email:'user@tester.com',
                      password: '123456', phone: '11977777777', 
                      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"))

      expect(user).to be_valid
    end
    it 'not valid - short password' do
      user = User.new(name: 'Sr User', email:'user@tester.com',
                      password: '12345', phone: '11977777777', 
                      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png")) 

      expect(user).to_not be_valid
    end
    it 'not valid - not email' do
      user = User.new(name: 'Sr User', email:'user',
                      password: '123456', phone: '11977777777', 
                      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png")) 

      expect(user).to_not be_valid
    end
    it 'not valid - already registered' do
      user = User.new(name: 'Sr User', email:'user@tester.com',
                      password: '123456', phone: '11977777777', 
                      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png")) 
      user_copy = user.dup

      expect(user_copy).to_not be_valid
    end
    it 'not valid - blank phone' do
      user = User.new(name: 'Sr User', email:'user@tester.com',
                      password: '12345', phone: '', 
                      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png")) 

      expect(user).to_not be_valid
    end
    it 'not valid - no avatar' do
      user = User.new(name: 'Sr User', email:'user@tester.com',
                      password: '12345', phone: '11977777777') 

      expect(user).to_not be_valid
    end
  end
end
