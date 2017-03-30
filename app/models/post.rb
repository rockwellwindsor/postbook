class Post < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :comments, dependent: :destroy

  # Validations
  validates_presence_of :user_id, :title, :body

  # Scopes
  default_scope {order(created_at: :desc)}
end
