require 'rails_helper'
require 'spec_helper'

RSpec.describe User, type: :model do

  before do
   @user = User.new(id: rand(1..500), first_name: "Example", last_name: "User", email: "user@example.com", password: "password", password_confirmation: "password")
  end
  # ROCKWELL_SUBMISSION_TEST
  subject {@user}
  it {should respond_to(:first_name)}
  it {should respond_to(:last_name)}
  it {should respond_to(:email)}
  it {should respond_to(:password)}
  it {should respond_to(:password_confirmation)}
  it {should respond_to(:posts)}
  it {should be_valid}
  # ROCKWELL_SUBMISSION_TEST
  describe "when first name is not present" do
    before {@user.first_name = " "}
    it {should_not be_valid}
  end
  # ROCKWELL_SUBMISSION_TEST
  describe "when last name is not present" do
    before {@user.last_name = " "}
    it {should_not be_valid}
  end
  # ROCKWELL_SUBMISSION_TEST
  describe "when email is not present" do
    before {@user.email = " "}
    it {should_not be_valid}
  end
  # ROCKWELL_SUBMISSION_TEST
  describe "when first name is too long" do
    before {@user.first_name = "a" * 31}
    it {should_not be_valid}
  end
  # ROCKWELL_SUBMISSION_TEST
  describe "when last name is too long" do
    before {@user.last_name = "a" * 31}
    it {should_not be_valid}
  end
  # ROCKWELL_SUBMISSION_TEST
  describe "when email format is invalid" do
    it "should be invalid" do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        @user.email = invalid_address
        @user.should_not be_valid
      end
    end
  end

  describe "when email format is valid" do
    it "should be valid" do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        @user.email = valid_address
        @user.should be_valid
      end
    end
  end

  describe "when email address is already taken" do
    before do
      user_with_same_email = @user.dup
      user_with_same_email.email = @user.email.upcase
      user_with_same_email.save
    end

    it { should_not be_valid }
  end

  describe "when password is not present" do
    before { @user.password = @user.password_confirmation = " " }
    it { should_not be_valid }
  end

  describe "when password doesn't match confirmation" do
    before { @user.password_confirmation = "mismatch" }
    it { should_not be_valid }
  end

  describe "when password confirmation is nil" do
    before {@user.password_confirmation = nil}
    it {should_not be_valid}
  end

  describe "when password is too short" do
    before {@user.password = @user.password_confirmation = "a" * 5}
    it {should_not be_valid}
  end

  describe "post associations" do 
    before { @user.save }
    let!(:older_post) do
      FactoryGirl.create(:post, user: @user, created_at: 1.day.ago)
    end
    let!(:newer_post) do
      FactoryGirl.create(:post, user: @user, created_at: 1.hour.ago)
    end

    it "should have the right posts in the right order" do
      @user.posts.should == [newer_post, older_post]
    end

    it "should delete a users posts when that user is deleted" do
      post = Post.new(id: rand(1..500), title: "Awesome post of the future", body: "In the future the big thing will be...", user_id: @user.id)
      @user.posts << post
      expect {@user.destroy}.to change {Post.count}.by(-@user.posts.count)
    end
  end 
end