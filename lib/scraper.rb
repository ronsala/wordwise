# Scrape web page containing word and the individual pages with their
# definitions.
class Wordwise::Scraper
  attr_accessor :word, :def, :def2, :def3, :def4, :length, :words
  attr_accessor :origin, :word_nos, :doc, :words, :entry_urls, :question_array

  # Scrape word list page.
  def self.scrape_index_page
    @doc = Nokogiri::HTML(open("https://en.oxforddictionaries.com/explore/weird-and-wonderful-words")) # Temp: Works
    @entry_urls = []
    @length = @doc.css('td a').length
    @question_urls = []
    @words = []
    @defs = []
    @origin = []

    (0..@length - 1).each do |i| # Temp: Works
      @entry_urls << @doc.css('td a')[i].attribute('href').value.split(':').to_a.insert(1, 's:').join
    end
    @entry_urls
  end

  # Get a question from array with #sample.
  def self.scrape_entry_pages
    @docs = []
    @question_array = []

    begin

    question_urls = @entry_urls.sample(4)

    question_urls.each_index do |i|
      @docs << Nokogiri::HTML(open(question_urls[i]))
    end
    
    @docs.each_index do |i|
      @words << @docs[i].css('.hw').text.match(/^[a-zA-Z]+/).to_s
      @defs << @docs[i].css('.ind').first.text
    end
    @origin = @docs[0].css('.senseInnerWrapper p').text
    @question_array = [@words, @defs, @origin]

    rescue StandardError=>e
      self.scrape_entry_pages
    end
  end
end