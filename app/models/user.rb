class User < ActiveRecord::Base
  #TODO надо ли здесь прописывать has_many comments, posts и т д
  before_create :add_normal_role
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :lockable, :confirmable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :first_name, :last_name, :initial_role, :remember_me

  ROLES = %w(admin user)

  def add_normal_role
    self.role=(ROLES[1])
  end
end
