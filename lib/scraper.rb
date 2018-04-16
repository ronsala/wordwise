# Scrape web page containing word and the individual pages with their
# definitions.
# class Wordwise::Scraper
class Scraper
  attr_accessor :word_1, :def_1, :def_2, :def_3, :def_4, :defs, :length, :origin_1, :word_nos, :doc

  # Scrape word list page.
  def initialize
    @word_nos = []
    @doc = Nokogiri::HTML(open("https://en.oxforddictionaries.com/explore/weird-and-wonderful-words"))
    words = @doc.css('td a')
    @length = words.length
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
    # entry_url_1 = doc.css('td a')[@word_nos[0]].attribute('href').value.split(':').to_a.insert(1, 's:').join
    # doc_1 = Nokogiri::HTML(open(entry_url_1))
    # @word_1 = doc_1.css('.hw').text.match(/^[a-zA-Z]+/)
    # @definition_1 = doc_1.css('.ind').first.text
    # @origin_1 = doc_1.css('.senseInnerWrapper p').text

    # entry_url_2 = doc.css('td a')[@word_nos[1]].attribute('href').value.split(':').to_a.insert(1, 's:').join
    # doc_2 = Nokogiri::HTML(open(entry_url_2))
    # word_2 = doc_2.css('.hw').text.match(/^[a-zA-Z]+/)
    # @definition_2 = doc_2.css('.ind').first.text

    # entry_url_3 = doc.css('td a')[@word_nos[2]].attribute('href').value.split(':').to_a.insert(1, 's:').join
    # doc_3 = Nokogiri::HTML(open(entry_url_3))
    # word_3 = doc_3.css('.hw').text.match(/^[a-zA-Z]+/)
    # @definition_3 = doc_3.css('.ind').first.text

    # entry_url_4 = doc.css('td a')[@word_nos[3]].attribute('href').value.split(':').to_a.insert(1, 's:').join
    # doc_4 = Nokogiri::HTML(open(entry_url_4))
    # word_4 = doc_4.css('.hw').text.match(/^[a-zA-Z]+/)
    # @definition_4 = doc_4.css('.ind').first.text
    entry_urls = []
    @word_nos.each_index do |i|
      entry_urls << doc.css('td a')[@word_nos[i]].attribute('href').value.split(':').to_a.insert(1, 's:').join
    end
  end

  # Check for empty strings.
  def validate
    [@word_1, @word_2, @word_3, @word_4, @def_1, @def_2, @def_3, @def_4, @origin_1].each do |word| 
      if word == "" 
        initialize
      end
  end
end