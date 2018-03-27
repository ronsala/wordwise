require 'open-uri'
require 'pry'
require 'nokogiri'

test_url = "https://en.wiktionary.org/wiki/formosanos"


class Word

  attr_accessor :scraped_students

  def initialize

  end

  def random_lang
    random_page = Nokogiri::HTML(open("https://en.wiktionary.org/wiki/Special:Random"))
    lang = random_page.css("h2 .mw-headline").text
    binding.pry
  end

  def english?
    random_lang
    if lang == "English" word 
  end

  rand_english

#   def self.scrape_index_page(index_url)
#     scraped_students = []
#     html = Nokogiri::HTML(open(index_url))
#     html.css("div.student-card").each do |card|
#       student = {
#       :name => card.css(".student-name").text,
#       :location => card.css(".student-location").text,
#       :profile_url => card.css("a").attribute("href").value
#     }
#     scraped_students << student
#     end
#     scraped_students
#   end

#   def self.scrape_profile_page(profile_url)
#     scraped_student = {}
#     html = Nokogiri::HTML(open(profile_url))
#     html.css(".vitals-container a").each do |a|
#       if a.attribute("href").value =~ (/twitter/)
#         scraped_student[:twitter] = a.attribute("href").value
#       elsif a.attribute("href").value =~ (/linkedin/)
#         scraped_student[:linkedin] = a.attribute("href").value
#       elsif a.attribute("href").value =~ (/github/)
#         scraped_student[:github] = a.attribute("href").value
#       else
#         scraped_student[:blog] = a.attribute("href").value
#       end
#     end
#     scraped_student[:profile_quote] = html.css(".profile-quote").text
#     scraped_student[:bio] = html.css(".description-holder p").text.split.join(" ")
#     scraped_student
#   end
end