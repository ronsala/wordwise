# [] Test merging.

require 'open-uri'
require 'pry'
require 'nokogiri'

class Question

  def initialize
    doc = Nokogiri::HTML(open("https://en.oxforddictionaries.com/explore/weird-and-wonderful-words"))
    words = doc.css('td a')
    length = words.length

    rand_word_no_1 = rand(0..length)
    entry_url_1 = doc.css('td a')[rand_word_no_1].attribute('href').value.split(':').to_a.insert(1, 's:').join
    doc_1 = Nokogiri::HTML(open(entry_url_1))
    word_1 = doc_1.css('.hw').text
    definition_1 = doc_1.css('.ind').first.text
    origin_1 = doc_1.css('.senseInnerWrapper p').text



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

    puts word_1
    puts definition_1
    puts origin_1
    # puts a
    # puts b
    # puts c
    # puts d

  end
end

test_q = Question.new