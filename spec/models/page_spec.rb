# encoding: UTF-8
# == Schema Information
#
# Table name: pages
#
#  id         :integer          not null, primary key
#  title      :string(255)      not null
#  body       :text             not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  key        :string(255)      not null
#
# Indexes
#
#  index_pages_on_key   (key)
#  index_pages_on_name  (title) UNIQUE
#

require 'spec_helper'  # ~> LoadError: cannot load such file -- spec_helper

shared_examples_for 'smart column' do |column|
  it 'should not be allow to be empty' do
    bad_page = build :page, column => ''
    bad_page.should_not be_valid
  end
  it 'should automatically apply smartypants on save' do
    page = create :page
    page.send("#{column}=".to_sym, '<p>Quoted "string".</p>')
    page.save!
    page.send(column).should == '<p>Quoted &ldquo;string&rdquo;.</p>'
  end
  it 'should be html_safe' do
    page = create :page
    page.send(column).should be_html_safe
  end
end

describe Page do
  it 'should enjoy sunny days' do
    happy_page = create :page
    happy_page.should be_valid
  end

  describe '#key' do
    it 'should not allow duplicates' do
      create :page, key: 'page'
      dup = build :page, key: 'page'
      dup.should_not be_valid
    end

    it 'should not be allow to be empty' do
      bad_page = build :page, key: ''
      bad_page.should_not be_valid
    end
  end

  describe '#title' do
    it_should_behave_like 'smart column', :title
  end

  describe '#body' do
    it_should_behave_like 'smart column', :body
  end
end
