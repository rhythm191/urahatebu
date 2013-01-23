# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  sequence(:sequence_feed) {|n| "feed#{n}" }

  factory :feed do
    title "Hoge"
    link "http://test.example.com/hoge.html"
    category "hotentry"
    description "HogeHuga"
    subject "test"
    marked "2013-01-19"
    bcount 1
  end

  factory :testFeeds, class: Feed do
  	title { FactoryGirl.generate(:sequence_feed) }
  	link { "http://test.example.com/#{title}.html" }
    category "hotentry"
  	description { "this is #{title}" }
  	subject "test"
  	marked "2013-01-19"
  	bcount 3
  end
end
