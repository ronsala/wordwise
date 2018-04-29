# Scrapes web page containing word and the individual pages with their
# definitions.
class Wordwise::Scraper
  attr_accessor :words, :origin, :doc, :question_array, :list_urls
  attr_accessor :lists, :words_ary, :word_urls

  BASEPATH = 'https://en.oxforddictionaries.com'

  # Scrapes page with list of word lists.
  def self.scrape_word_lists
    html = Nokogiri::HTML(open(BASEPATH + '/explore/word-lists'))
    @list_urls = []
    @lists = []
    (0..html.css('.record').length - 1).each do |i|
      @list_urls << BASEPATH + html.css('.record a')[i].attribute('href').value
      @lists << html.css('.record h2')[i].text
    end
  end

  def self.lists
    @lists = @lists
  end

  # Scrapes a page with a word list.
  def self.scrape_word_list(page_idx)
    @doc = Nokogiri::HTML(open(@list_urls[page_idx]))
    @words_ary = []
    (0..@doc.css('tr').length - 1).each do |i|
      @words_ary << @doc.css('tr')[i].css('td')[0].text
    end
    @words_ary.shift # Removes any column headings
    @words_ary.pop # Removes empty string from last td
    @words_ary.delete_if {|w| w =~ /\W/} # Removes words with non-word character
  end

  # Samples 4 urls to words' pages and parse the question word, its origin and
  # definition, and 3 more definitions.
  def self.scrape_entry_pages
    docs = []
    @words = []
    @defs = []
    word_urls = []
    begin
      question_words = @words_ary[1..@words_ary.size - 1].sample(4)

      question_words.each_index do |i|
        word_urls << "#{BASEPATH}/definition/#{question_words[i]}"
        docs << Nokogiri::HTML(open(word_urls[i]))
      end

      docs.each_index do |i|
        @defs << docs[i].css('.ind').first.text
      end

      @origin = docs[0].css('.senseInnerWrapper p').text
      @question_array = [question_words, @defs, @origin]
      binding.pry
    rescue NoMethodError => e # Selects new word list when data missing
      scrape_entry_pages
    end
  end
end