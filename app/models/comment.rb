class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :commentable, polymorphic: true
  has_many :comments, as: :commentable

  default_scope -> { order(created_at: :desc)  }
  validates :user_id, presence: true
  validates :commentable_id, presence: true
  validates :commentable_type, presence: true
  validates :content, presence: true, length: { maximum: 300 }
end
