class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :reviews, dependent: :destroy
  has_many :reservations, dependent: :destroy
  after_create :send_welcome_email, unless: -> { Rails.env.development? || Rails.env.test? }

  def admin?
    self.admin == true
  end

  private
  def send_welcome_email
    UserMailer.with(user: self).welcome.deliver_now
  end
end
