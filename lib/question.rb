require 'open-uri'
require 'pry'
require 'nokogiri'

class Question

  attr_accessor :word, :a, :b, :c, :d, :lang

  def initialize(word, a, b, c, d)
    @word = word
    @a = a
    @b = b
    @c = c
    @d = d
    puts "#{@current_player}, what is #{@word}?"
  end

  def self.random_entry
    random_entry = Nokogiri::HTML(open("https://en.wiktionary.org/wiki/Special:Random"))
    @lang = random_entry.css("h2 .mw-headline").text
  end

  def self.english
    binding.pry
    if @lang == "English" 
      @word = @lang
    else
      self.random_entry
    end
  end

  self.english


end