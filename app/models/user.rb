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

  validates :name, presence: true, unique: true
  validates :password, presence: true, on: :create
end
