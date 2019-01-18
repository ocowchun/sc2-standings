class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable,
         :confirmable, :lockable, :trackable

  def gravatar_profile_image(size=200)
    hex = Digest::MD5.hexdigest(email)
    "https://www.gravatar.com/avatar/#{hex}?d=mm&s=#{size}"
  end
end
