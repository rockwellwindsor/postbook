require 'rails_helper'
require 'spec_helper'

# This file is responsible for the tests testing the CRUD operations for the post resource
RSpec.describe Post, type: :model do

  # Create a post and user
  before do
    @user = FactoryGirl.build(:user)
    @post = Post.new(title: "Awesome post of the future", body: "In the future the big thing will be...", user_id: @user.id)
  end

  subject {@post}
  it {should respond_to(:title)}
  it {should respond_to(:body)}
  it {should respond_to(:user_id)}
  it {should be_valid}

  # Validations
  describe "Validations" do
    describe "when title is not present" do
      before {@post.title = " "}
      it {should_not be_valid}
    end
    describe "when description is not present" do
      before {@post.body = " "}
      it {should_not be_valid}
    end
    describe "when user id is not present" do
      before {@post.user_id = " "}
      it {should_not be_valid}
    end
  end

  # Associations
  describe "Associations" do
    it "belongs to a user" do
      user = described_class.reflect_on_association(:user)
      expect(user.macro).to eq :belongs_to
    end
    it "has many comments" do
      comments = described_class.reflect_on_association(:comments)
      expect(comments.macro).to eq :has_many
    end
  end
end
