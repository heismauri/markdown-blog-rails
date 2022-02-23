class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged
  belongs_to :user
  has_one_attached :thumbnail

  default_scope { order(created_at: :DESC) }
  scope :authored_by, ->(name) { where(user: name) }

  def date
    created_at.strftime('%B %d, %Y')
  end

  def next
    Post.where('id > ?', id).order(id: :ASC).first
  end

  def previous
    Post.where('id < ?', id).order(id: :DESC).first
  end

  def should_generate_new_friendly_id?
    title_changed?
  end
end
