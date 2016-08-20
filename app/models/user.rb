class User < ActiveRecord::Base
  has_many :pings
  validates :username, :first_name, :lastname, :email, :password, presence: true
  validates :username, :email, uniqueness: true

  def full_name
    "#{first_name} #{lastname}"
  end
end
