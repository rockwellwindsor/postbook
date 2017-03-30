require 'rails_helper'

RSpec.describe Comment, type: :model do
  let(:user) { FactoryGirl.create(:user) }
  let(:post) { FactoryGirl.create(:post) }

  before do
    # This code is not idiomatically correct.
    @comment = Comment.new(body: "Lorem ipsum dolor ...", user_id: user.id, post_id: post.id)
  end

  subject { @comment }

  it { should respond_to(:content) }
  it { should respond_to(:user_id) }
  it { should respond_to(:post_id) }

  it { should be_valid }

  describe "when user_id is not present" do
    before { @comment.user_id = nil }
    it { should_not be_valid }
  end

  describe "when post_id is not present" do
    before { @comment.post_id = nil }
    it { should_not be_valid }
  end
end
