class Post < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :comments, dependent: :destroy

  # Validations
  validates :user_id, :title, :body, presence: true

  # Scopes
  default_scope -> { order('created_at DESC') }
end
