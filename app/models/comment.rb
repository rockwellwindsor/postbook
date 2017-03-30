class Comment < ActiveRecord::Base
  # Associations 
  belongs_to :user
  belongs_to :post

  # Validations
  validates :body, :user_id, :post_id, presence: true
  
  # Scopes
  default_scope {order(created_at: :asc)}
end