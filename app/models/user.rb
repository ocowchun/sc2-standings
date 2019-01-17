class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  def gravatar_profile_image
    hex = Digest::MD5.hexdigest(email)
    "https://www.gravatar.com/avatar/#{hex}?d=mm&s=200"
  end
end
