class User < ApplicationRecord
  before_save :set_full_name

  extend FriendlyId
  friendly_id :full_name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy

  private

  def set_full_name
    self.full_name = [first_name, last_name].join(' ')
  end

  def should_generate_new_friendly_id?
    first_name_changed? || last_name_changed?
  end
end
