class Post < ApplicationRecord
  # FriendlyId
  extend FriendlyId
  friendly_id :title, use: :slugged

  # Search
  include PgSearch::Model
  pg_search_scope :search_by_title_and_content, against: %i[title content], using: { tsearch: { prefix: true } }

  # Associations
  belongs_to :user

  # Active Storage
  has_one_attached :thumbnail

  # Scopes
  default_scope { order(created_at: :DESC) }
  scope :authored_by, ->(name) { where(user: name) }

  # Validations
  validates :title, presence: true, length: { minimum: 10 }
  validates :content, presence: true, length: { minimum: 100 }
  validate :thumbnail_validation
  validate :thumbnail_mime_type

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

  def thumbnail_validation
    errors.add(:thumbnail, 'must have a file') unless thumbnail.attached?
  end

  def thumbnail_mime_type
    return unless thumbnail.attached? && !thumbnail.content_type.in?(%w[image/jpeg image/png])

    errors.add(:thumbnail, 'must be an image')
  end
end
