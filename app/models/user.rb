class User < ActiveRecord::Base

  validates :email, :presence => true
  validates :first_name, :presence => true
  validates :last_name, :presence => true
  has_many :comments
  has_many :posts
  has_many :solutions
  before_create :add_normal_role
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable #, :confirmable

  # Setup accessible (or protected) attributes for your model
  # attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :remember_me

  ROLES = %w(admin student guest)

  def add_normal_role
    self.role=(ROLES[1])
  end
end
