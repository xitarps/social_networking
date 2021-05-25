require 'rails_helper'

RSpec.describe Post, type: :model do
  context 'create' do
    it 'is valid' do
      user = User.new(name: 'Sr User', email:'user@tester.com',
                      password: '123456', phone: '11977777777', 
                      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"))

      post = user.posts.new(body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,
        when an unknown printer took a galley of type and scrambled it to make a type specimen book.
        It has survived not only five centuries, but also the leap into electronic typesetting,
        remaining essentially unchanged.')

      expect(post).to be_valid
    end
    it 'is not valid - user must exist' do
      user = User.new(name: 'Sr User', email:'user@tester.com',
                      password: '123456', phone: '11977777777', 
                      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"))

      post = Post.new(body: 'Lorem Ipsum is simply dummy text of the printing and typesetting industry.
        Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s,
        when an unknown printer took a galley of type and scrambled it to make a type specimen book.
        It has survived not only five centuries, but also the leap into electronic typesetting,
        remaining essentially unchanged.')

      expect(post).not_to be_valid
    end
  end
end
