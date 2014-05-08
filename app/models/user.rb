# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name, :password, :password_confirmation
  has_secure_password

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :name
  validates_uniqueness_of :name

  validates_presence_of :password, :on => :create
end
