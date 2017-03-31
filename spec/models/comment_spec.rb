require 'rails_helper'
require 'spec_helper'

# This file is responsible for the tests testing the CRUD operations for the Comment resource
RSpec.describe Comment, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post) }

  before do
    # This code is not idiomatically correct.
    @comment = Comment.new(id: rand(1..500), body: "Lorem ipsum dolor et...", user_id: user.id, post_id: post.id)
  end
  # ROCKWELL_SUBMISSION_TEST
  subject {@comment}
  it {should respond_to(:body)}
  it {should respond_to(:user_id)}
  it {should respond_to(:post_id)}
  it {should be_valid}

  # Validations
  describe "Validations" do
    describe "when user_id is not present" do
      before {@comment.user_id = nil}
      it {should_not be_valid}
    end
    describe "when post_id is not present" do
      before {@comment.post_id = nil}
      it {should_not be_valid}
    end
  end
  # Associations
  describe "Associations" do
    # ROCKWELL_SUBMISSION_TEST
    it "belongs to a user" do
      user = described_class.reflect_on_association(:user)
      expect(user.macro).to eq :belongs_to
    end
    # ROCKWELL_SUBMISSION_TEST
    it "belongs to a post" do
      post = described_class.reflect_on_association(:post)
      expect(post.macro).to eq :belongs_to
    end
  end
end
