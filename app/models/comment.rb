class Comment < ActiveRecord::Base
  # Associations 
  belongs_to :user
  belongs_to :post

  # Validations
  validates :body, :user_id, presence: true
end