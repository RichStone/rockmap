class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

  has_one :roadmap, dependent: :destroy

  def after_confirmation
    UserMailer.with(user: self).welcome_email.deliver_later
  end
end
