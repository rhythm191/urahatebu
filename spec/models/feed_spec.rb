# encode: utf-8

require 'spec_helper'

describe Feed do
  
  describe '.all' do
  	before do
  		FactoryGirl.create(:feed)
  	end

    subject { Feed.all }
    it { should have(1).items }
  end

  describe 'all for 10' do
  	before do
  		FactoryGirl.create_list(:testFeeds, 10)
  	end

  	subject { Feed.all }
  	it { should have(10).items }
  end

  describe '.new' do

    context 'give null attributes' do
    	subject { Feed.new }
    	it { should_not be_valid }
    end
  
    context 'give valid attributes' do
      subject { Feed.new(title: 'huga', link: 'http://test.example.com/huga.html', category: 'hotentry',  description: 'hugahuga', subject: 'test', marked: Time.now, bcount: 3) }
  	  it { should be_valid }
  	end
  end

  describe '.parse' do
  	subject { Feed.parse(File.new('./spec/rss/rss.xml'), 'hotentry') }
    it { should have(30).items }
  end
end
