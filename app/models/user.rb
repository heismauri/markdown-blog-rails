class User < ApplicationRecord
  extend FriendlyId
  friendly_id :full_name, use: :slugged
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable
  has_many :posts, dependent: :destroy
  before_save :set_full_name

  def set_full_name
    self.full_name = [first_name, last_name].join(' ')
  end
end
