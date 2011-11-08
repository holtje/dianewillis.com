class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :password, :on => :create
end
