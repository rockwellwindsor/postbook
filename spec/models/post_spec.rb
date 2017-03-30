require 'rails_helper'
require 'spec_helper'

# This file is responsible for the tests testing the CRUD operations for the Post resource
RSpec.describe Post, type: :model do

  # Create a post and user
  before do
    @user = User.new(id: rand(1..500), first_name: "New", last_name: "TestUser", email:"email@email.com", password: "password", password_confirmation: "password", confirmed_at: Time.now)
    @post = Post.new(id: rand(1..500), title: "Awesome post of the future", body: "In the future the big thing will be...", user_id: @user.id)
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
    #  Testing default scope order
    describe "comments association" do
      let!(:older_comment) do
        FactoryGirl.create(:comment, user: @user, post: @post, created_at: 1.day.ago)
      end
      let!(:newer_comment) do
        FactoryGirl.create(:comment, user: @user, post: @post, created_at: 1.hour.ago)
      end

      it "should have the right comments in the right order" do
        @post.comments.should == [older_comment, newer_comment]
      end

      it "should have the right comments in the right order" do
        @post.comments.should_not == [newer_comment, older_comment]
      end
    end

    it "has many comments" do
      comments = described_class.reflect_on_association(:comments)
      expect(comments.macro).to eq :has_many
    end
  end
end
