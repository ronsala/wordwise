# Scrapes web page containing word and the individual pages with their
# definitions.
class Wordwise::Scraper

  BASEPATH = 'https://www.lexico.com'

  # Scrapes page with list of word lists.
  def self.scrape_word_lists
    html = Nokogiri::HTML(URI.open(BASEPATH + '/explore/word-lists'))
    @list_urls, lists = [], []

    # Populates arrays of word list names and urls.
    (0..html.css('.record').size - 1).each do |i|
      @list_urls << BASEPATH + html.css('.record a')[i].attribute('href').value
      lists << html.css('.record h2')[i].text
    end

    # Removes list not fitting format.
    @list_urls.delete_if { |u| u =~ /phobias/ }
    lists.delete_if { |l| l =~ /Phobias/ }

    lists
  end

  # Scrapes a page with a word list.
  def self.scrape_word_list(page_idx)
    
    doc = Nokogiri::HTML(URI.open(@list_urls[page_idx]))
    @words_defs = {}

    # Creates hash of word-definition pairs.
    (0..doc.css('tr').length - 1).each do |i|
      @words_defs.store(doc.css('tr')[i].css('td')[0].text, doc.css('tr')[i].css('td')[1].text)
    end

    # Removes invalid entries
    @words_defs.delete('')
    @words_defs.delete_if { |w| w =~ /\W/ || w =~ /xylene/ || w =~ /do/ }

    # Converts hash to array for use in .scrape_entry_pages.
    @words_defs_ary = @words_defs.to_a
  end

  # Samples 4 urls to words' pages and parses the question word, its origin and
  # definition, and 3 more definitions.
  def self.scrape_entry_pages
    docs, word_urls = [], []
    question_words = Wordwise::CLI.question_words
    # Iterates over array to make array of urls that are parsed by Nokogiri
    # and put in another array.
    question_words.each_index do |i|
      word_urls << "#{BASEPATH}/definition/#{question_words[i]}"
      docs << Nokogiri::HTML(URI.open(word_urls[i]))
    end

    # Sets variable for word origin.
    origin_wrapper = docs[0].css('.senseInnerWrapper p')[-1]
    if origin_wrapper
      origin = origin_wrapper.text
    else
      origin = 'Origin not available.'
    end
  end
end
