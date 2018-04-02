# [] Test merging.

require 'open-uri'
require 'pry'
require 'nokogiri'
require 'open_uri_redirections'

class Question

  def initialize
    doc = Nokogiri::HTML(open("https://en.oxforddictionaries.com/explore/weird-and-wonderful-words"))
    words = doc.css('td a').to_a
    length = words.length
    rand_word_no = rand(0..length)
    entry_url = doc.css('td a').to_a[rand_word_no].attribute('href').value
    entry_url_split = entry_url.split(':').to_a
    entry_url_s = entry_url_split.insert(1, 's:').join
    doc_2 = Nokogiri::HTML(open(entry_url_s))
    word = doc_2.css('.hw').text
    definition = doc_2.css('.ind').first.text
    origin = doc_2.css('.senseInnerWrapper p').text

    true_def = rand(1..4)

    # case true_def
    #   when 1 
    #     a = defin_1
    #   when 2 
    #     b = defin_1
    #   when 3
    #     c = defin_1
    #   when 4 
    #     d = defin_1
    #     # binding.pry
    # end

    # if a.nil? then a = defin_2 end
    # if b.nil? then b = defin_3 end
    # if c.nil? then c = defin_4 end
    # if d.nil? then d = defin_5 end

    puts word
    puts definition
    # puts a
    # puts b
    # puts c
    # puts d

  end
end

test_q = Question.new