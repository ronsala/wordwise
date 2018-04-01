# [] Test merging.

require 'open-uri'
require 'pry'
require 'nokogiri'

class Question

  # attr_accessor :word, :a, :b, :c, :d, :defin

  def initialize
    # random_entry_1 = Nokogiri::HTML(open("https://en.wiktionary.org/wiki/Special:RandomInCategory/English_lemmas#English"))
    # word = random_entry_1.css('#firstHeading').text
    # defin_1 = random_entry_1.css('#mw-content-text div ol li').text.split("\n")[0]

    # random_entry_2 = Nokogiri::HTML(open("https://en.wiktionary.org/wiki/Special:RandomInCategory/English_lemmas#English"))
    # defin_2 = random_entry_2.css('#mw-content-text div ol li').text.split("\n")[0]

    # random_entry_3 = Nokogiri::HTML(open("https://en.wiktionary.org/wiki/Special:RandomInCategory/English_lemmas#English"))
    # defin_3 = random_entry_3.css('#mw-content-text div ol li').text.split("\n")[0]

    # random_entry_4 = Nokogiri::HTML(open("https://en.wiktionary.org/wiki/Special:RandomInCategory/English_lemmas#English"))
    # defin_4 = random_entry_4.css('#mw-content-text div ol li').text.split("\n")[0]

    # random_entry_5 = Nokogiri::HTML(open("https://en.wiktionary.org/wiki/Special:RandomInCategory/English_lemmas#English"))
    # defin_5 = random_entry_5.css('#mw-content-text div ol li').text.split("\n")[0]

    doc = Nokogiri::HTML(open("https://en.oxforddictionaries.com/explore/weird-and-wonderful-words"))
    words = doc.css('td a').to_a
    length = words.length
    rand_word_no = rand(0..length)
    entry = random_entry_1.css('td a').to_a[rand_word_no]
    word = entry.text
    # defin_1 = random_entry_1.css('#mw-content-text div ol li').text.split("\n")[0]
    doc_2 = Nokogiri::HTML(open("entry"))
    defin_1 = 


    true_def = rand(1..4)

    case true_def
      when 1 
        a = defin_1
      when 2 
        b = defin_1
      when 3
        c = defin_1
      when 4 
        d = defin_1
        # binding.pry
    end

    # if a.nil? then a = defin_2 end
    # if b.nil? then b = defin_3 end
    # if c.nil? then c = defin_4 end
    # if d.nil? then d = defin_5 end

    puts words
    puts length
    puts word
    # puts a
    # puts b
    # puts c
    # puts d

  end

end

test_q = Question.new

# puts test_q.instance_variables
# test_q.random_entry