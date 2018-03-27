require 'open-uri'
require 'pry'
require 'nokogiri'
require 'mechanize'

# agent = Mechanize.new
# page = agent.get('https://en.wiktionary.org/wiki/Special:RandomInCategory').search(id="ooui-php-1")
# # search_form = page.form('f')
# # search_form.q = 'ruby mechanize'
# # page = agent.submit(google_form)
# pp page

class Question

  attr_accessor :word, :a, :b, :c, :d, :fos, :definition

  # def initialize(word, a, b, c, d)
  #   @word = word
  #   @a = a
  #   @b = b
  #   @c = c
  #   @d = d
  #   puts "#{@current_player}, what is #{@word}?"
  # end

  def self.random_entry
    random_entry = Nokogiri::HTML(open("https://en.wiktionary.org/wiki/Special:RandomInCategory/English_lemmas#English"))
    @word = random_entry.css('#firstHeading').text
    @definition = random_entry.css('#mw-content-text div ol li').text.split("\n")[0]
    binding.pry
  end


  self.random_entry


end