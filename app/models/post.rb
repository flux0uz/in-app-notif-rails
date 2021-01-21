class Post < ApplicationRecord
  belongs_to :user

  has_many :comments, dependent: :destroy
  has_many :users, through: :comments

  validates :title, presence: true, length: { minimum: 3, maximum: 60 }
  validates :body, presence: true

  after_create_commit { broadcast_append_to 'posts' }
  after_update_commit { broadcast_replace_to 'posts' }
  after_destroy_commit { broadcast_remove_to 'posts' }
end
