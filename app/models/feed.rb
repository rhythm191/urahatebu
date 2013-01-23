require 'active_support'

class Feed < ActiveRecord::Base
  attr_accessible :bcount, :subject, :description, :link, :marked, :category, :title

  validates :title,
    :presence => true
  validates :link,
    :presence => true,
    :uniqueness => true
  validates :category,
    :presence => true
  validates :subject,
    :presence => true
  validates :marked,
    :presence => true
  validates :bcount,
    :presence => true,
    :numericality => { :only_integer => true }

  def self.parse(xml, category)
    doc = Hash.from_xml(xml)
    doc['RDF']['item'].map do |item|
    	Feed.new(
    		title: item['title'],
            link: item['link'],
            category: category,
    		description: item['description'],
    		subject: item['subject'],
    		marked: item['date'],
    		bcount: item['bookmarkcount'].to_i )
    end
  end

  def self.parse_and_save(xml, category)
  	feeds = self.parse(xml, category)
  	feeds.each {|f| f.save }
  end
end
