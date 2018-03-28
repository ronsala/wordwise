# [] Test merging.

require 'open-uri'
require 'pry'
require 'nokogiri'

class Question

  attr_accessor :word, :a, :b, :c, :d, :definition

  def initialize
    Question.random_entry
    true_def = rand(1..4)
    case true_def
      when 1 
        @a = @definition
      when 2 
        @b = @definition
      when 3
        @c = @definition
      when 4 
        @d = @definition
    end
    @word = word
    # @a = a
    # @b = b
    # @c = c
    # @d = d
    # puts "#{@current_player}, what is #{@word}?"
    puts @word
    puts @a
    puts @b
    puts @c
    puts @d
  end

  def self.random_entry
    random_entry = Nokogiri::HTML(open("https://en.wiktionary.org/wiki/Special:RandomInCategory/English_lemmas#English"))
    @word = random_entry.css('#firstHeading').text
    @definition = random_entry.css('#mw-content-text div ol li').text.split("\n")[0]
  end

  # self.random_entry

end

test_q = Question.new