# Scrape web page containing word and the individual pages with their
# definitions.
class Wordwise::Scraper
  attr_accessor :word, :def, :def2, :def3, :def4, :length
  attr_accessor :origin1, :word_nos, :doc, :words

  # Scrape word list page.
  def initialize
    @word_nos = []
    @doc = Nokogiri::HTML(open("https://en.oxforddictionaries.com/explore/weird-and-wonderful-words"))
    @words = @doc.css('td a')
    @length = words.length
    randomize
    scrape_defs
    validate
  end

  # Return array of unique, pseudorandom index numbers to chose words from list.
  def randomize
    until @word_nos.length == 4
      rand_no = rand(0..@length - 1)
      @word_nos.include?(rand_no) ? randomize : @word_nos << rand_no
    end
  end

  # Parses individual words' web pages. The first will be the word in
  # the question. The rest are used to generate false definitions.
  def scrape_definitions
    entry_url_1 = doc.css('td a')[@word_nos[0]].attribute('href').value.split(':').to_a.insert(1, 's:').join
    doc1 = Nokogiri::HTML(open(entry_url_1))
    @word = doc1.css('.hw').text.match(/^[a-zA-Z]+/)
    @def = doc1.css('.ind').first.text
    @origin1 = doc1.css('.senseInnerWrapper p').text

    entry_url_2 = doc.css('td a')[@word_nos[1]].attribute('href').value.split(':').to_a.insert(1, 's:').join
    doc2 = Nokogiri::HTML(open(entry_url_2))
    word2 = doc2.css('.hw').text.match(/^[a-zA-Z]+/)
    @def2 = doc2.css('.ind').first.text

    entry_url_3 = doc.css('td a')[@word_nos[2]].attribute('href').value.split(':').to_a.insert(1, 's:').join
    doc3 = Nokogiri::HTML(open(entry_url_3))
    word3 = doc3.css('.hw').text.match(/^[a-zA-Z]+/)
    @def3 = doc3.css('.ind').first.text

    entry_url_4 = doc.css('td a')[@word_nos[3]].attribute('href').value.split(':').to_a.insert(1, 's:').join
    doc4 = Nokogiri::HTML(open(entry_url_4))
    word4 = doc4.css('.hw').text.match(/^[a-zA-Z]+/)
    @def4 = doc4.css('.ind').first.text
    # entry_urls = []
    # @word_nos.each_index do |i|
    #   entry_urls << @doc.css('td a')[@word_nos[i]].attribute('href').value.split(':').to_a.insert(1, 's:').join
    # end
  end

  # Check for empty strings.
  def validate
    [@word1, @word2, @word3, @word4, @def, @def2, @def3, @def4, @origin1].each do |word| 
      if word == ''
        initialize
      end
    end
  end
end
