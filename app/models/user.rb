class User < ApplicationRecord
  has_many :posts, foreign_key: :author_id
  has_many :comments, foreign_key: :author_id
  has_many :likes, foreign_key: :author_id

  validates :name, presence: true, length: { maximum: 50 }
  attribute :posts_counter, :integer, default: 0
  validates :posts_counter, numericality: { only_integer: true, greater_than_or_equal_to: 0 }

  def posts_counter
    posts.order(created_at: :desc).count
  end
end
