require 'rails_helper'

RSpec.describe Like, type: :model do
  context "create" do
    it "successfully - user likes a post" do
  
      andrew = User.create(name: 'Sr Andrew', email:'Andrew@tester.com',
                        password: '123456', phone: '11977777777', 
                        avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"))

      jorg = User.create(name: 'Sr Jorg', email:'Jorg@tester.com',
                      password: '123456', phone: '11977777777', 
                      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"))

      matt = User.create(name: 'Sr Matt', email:'Matt@tester.com',
                      password: '123456', phone: '11977777777', 
                      avatar: fixture_file_upload(Rails.root.join("spec", "support", "test-avatar.png"), "image/png"))
  
      post = Post.create(user: andrew, body:'Test post content')
  
      Like.create(user: jorg, post: post)
  
      expect(post.likes.count).to eql 1
      expect(post.likes.first.user).to eql jorg
  
      Like.create(user: matt, post: post)
      expect(post.likes.count).to eql 2
      expect(post.likes.last.user).to eql matt
  
      Like.find_by(post: post, user: jorg).destroy
  
      expect(post.likes.count).to eql 1
      expect(post.likes.first.user).to eql matt
  
    end
  end
end
