class Post < ApplicationRecord
  belongs_to :user
  has_one_attached :thumbnail

  def to_param
    "#{id} #{title}".parameterize
  end

  def date
    created_at.strftime('%B %d, %Y')
  end

  def next
    Post.where("id > ?", id).order("id ASC").first
  end

  def previous
    Post.where("id < ?", id).order("id DESC").first
  end
end
