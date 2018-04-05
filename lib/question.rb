# [] prevent dups in @definions
require 'open-uri'
require 'pry'
require 'nokogiri'

class Question

  attr_accessor :word_1, :definition_1, :definition_2, :definition_3, :definition_4, :definitions, :definitions_s, :origin_1

  def initialize
    doc = Nokogiri::HTML(open("https://en.oxforddictionaries.com/explore/weird-and-wonderful-words"))
    words = doc.css('td a')
    length = words.length

    rand_word_no_1 = rand(0..length - 1)
    entry_url_1 = doc.css('td a')[rand_word_no_1].attribute('href').value.split(':').to_a.insert(1, 's:').join
    doc_1 = Nokogiri::HTML(open(entry_url_1))
    @word_1 = doc_1.css('.hw').text
    @definition_1 = doc_1.css('.ind').first.text
    @origin_1 = doc_1.css('.senseInnerWrapper p').text

    rand_word_no_2 = rand(0..length - 1)
    entry_url_2 = doc.css('td a')[rand_word_no_2].attribute('href').value.split(':').to_a.insert(1, 's:').join
    doc_2 = Nokogiri::HTML(open(entry_url_2))
    word_2 = doc_2.css('.hw').text
    @definition_2 = doc_2.css('.ind').first.text
    origin_2 = doc_2.css('.senseInnerWrapper p').text

    rand_word_no_3 = rand(0..length - 1)
    entry_url_3 = doc.css('td a')[rand_word_no_3].attribute('href').value.split(':').to_a.insert(1, 's:').join
    doc_3 = Nokogiri::HTML(open(entry_url_3))
    word_3 = doc_3.css('.hw').text
    @definition_3 = doc_3.css('.ind').first.text
    origin_3 = doc_3.css('.senseInnerWrapper p').text

    rand_word_no_4 = rand(0..length - 1)
    entry_url_4 = doc.css('td a')[rand_word_no_4].attribute('href').value.split(':').to_a.insert(1, 's:').join
    doc_4 = Nokogiri::HTML(open(entry_url_4))
    word_4 = doc_4.css('.hw').text
    @definition_4 = doc_4.css('.ind').first.text
    origin_4 = doc_4.css('.senseInnerWrapper p').text

    @definition = @definition_1
    @definitions = [@definition_1, @definition_2, @definition_3, @definition_4]
    @definitions_s = @definitions.shuffle
  end
end

# tq = Question.new