require 'rails_helper'

RSpec.describe Subscription, type: :model do
  context "create" do
    it "successfully - user can follow another user" do

      matt = User.new(name: 'Sr Matt', email:'bob@tester.com',
                      password: '123456', phone: '11977777777', 
                      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"))
      bob = User.new(name: 'Sr bob', email:'matt@tester.com',
                    password: '123456', phone: '11977777777', 
                    avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"))

      Subscription.create(followed: bob, followed_by: matt)

      expect(bob.followers.count).to eql 1
      expect(bob.followers).to include matt

      expect(matt.following.count).to eql 1
      expect(matt.following).to include bob

      expect(bob.following.count).to eql 0
      expect(bob.following).to_not include matt

      expect(matt.followers.count).to eql 0
      expect(matt.followers).to_not include bob

      donald = User.new(name: 'Sr Donald', email:'donald@tester.com',
                        password: '123456', phone: '11977777777', 
                        avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"))

      Subscription.create(followed: bob, followed_by: donald)

      expect(bob.followers.count).to eql 2
      expect(bob.followers).to include donald

      expect(donald.following.count).to eql 1
      expect(donald.following).to include bob
    end
  end
end