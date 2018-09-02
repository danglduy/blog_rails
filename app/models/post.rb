class Post < ApplicationRecord
  has_many :comments, as: :commentable, dependent: :destroy
  belongs_to :user

  default_scope ->{order(created_at: :desc)}
  validates :user_id, presence: true
  validates :title, presence: true
  validates :content, presence: true, length: {maximum: 2000}
end
