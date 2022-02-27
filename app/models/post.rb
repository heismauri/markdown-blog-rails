class Post < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  include PgSearch::Model
  pg_search_scope :search_by_title_and_content, against: %i[title content], using: { tsearch: { prefix: true } }

  belongs_to :user

  has_one_attached :thumbnail

  default_scope { order(created_at: :DESC) }
  scope :authored_by, ->(name) { where(user: name) }

  validates :title, presence: true, length: { minimum: 10 }
  validates :content, presence: true, length: { minimum: 100 }

  def date
    created_at.strftime('%B %d, %Y')
  end

  def next
    Post.unscope(:order).where('id > ?', id).order(id: :ASC).first
  end

  def previous
    Post.unscope(:order).where('id < ?', id).order(id: :DESC).first
  end

  private

  def should_generate_new_friendly_id?
    title_changed?
  end
end
