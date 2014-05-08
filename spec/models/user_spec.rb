# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  name            :string(255)
#  password_digest :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

require 'spec_helper'

describe User do
  subject(:user) { FactoryGirl.create :user }

  describe 'name' do
    it 'must be unique' do
      dup = FactoryGirl.build :user, name: user.name
      expect(dup).to_not be_valid
    end
  end
end
