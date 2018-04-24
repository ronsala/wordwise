# Scrape web page containing word and the individual pages with their
# definitions.
class Wordwise::Scraper
  attr_accessor :word, :def, :def2, :def3, :def4, :length
  attr_accessor :origin1, :word_nos, :doc, :words, :entry_urls

  # Scrape word list page.
  def initialize
    @doc = Nokogiri::HTML(open("https://en.oxforddictionaries.com/explore/weird-and-wonderful-words")) # Temp: Works
    @entry_urls = []
    @docs = []
    @length = @doc.css('td a').length

    (0..@length - 1).each do |i|
      @entry_urls << @doc.css('td a')[i].attribute('href').value.split(':').to_a.insert(1, 's:').join
    end
    
    # entry_urls.each_index do |i|
    #   @docs << Nokogiri::HTML(open(entry_urls[i]))
    # end
    # n = 0
    # 4.times do
    #   @docs << Nokogiri::HTML(open(entry_urls[n]))
    #   n += 1
    # end
    binding.pry
    # scrape_details
    # validate
  end

  # Parses individual words' web pages. The first will be the word in
  # the question. The rest are used to generate false definitions.
  # def scrape_details
  #   entry_url_1 = @doc.css('td a')[@word_nos[0]].attribute('href').value.split(':').to_a.insert(1, 's:').join
  #   @doc1 = Nokogiri::HTML(open(entry_url_1))
  #   @word = @doc1.css('.hw').text.match(/^[a-zA-Z]+/)
  #   @def = @doc1.css('.ind').first.text
  #   @origin1 = @doc1.css('.senseInnerWrapper p').text

  #   entry_url_2 = @doc.css('td a')[@word_nos[1]].attribute('href').value.split(':').to_a.insert(1, 's:').join
  #   @doc2 = Nokogiri::HTML(open(entry_url_2))
  #   word2 = @doc2.css('.hw').text.match(/^[a-zA-Z]+/)
  #   @def2 = @doc2.css('.ind').first.text

  #   entry_url_3 = @doc.css('td a')[@word_nos[2]].attribute('href').value.split(':').to_a.insert(1, 's:').join
  #   @doc3 = Nokogiri::HTML(open(entry_url_3))
  #   word3 = @doc3.css('.hw').text.match(/^[a-zA-Z]+/)
  #   @def3 = @doc3.css('.ind').first.text

  #   entry_url_4 = @doc.css('td a')[@word_nos[3]].attribute('href').value.split(':').to_a.insert(1, 's:').join
  #   @doc4 = Nokogiri::HTML(open(entry_url_4))
  #   word4 = @doc4.css('.hw').text.match(/^[a-zA-Z]+/)
  #   @def4 = @doc4.css('.ind').first.text
  # end

  # Check for empty strings.
  # def validate
  #   [@word1, @word2, @word3, @word4, @def, @def2, @def3, @def4, @origin1].each do |word| 
  #     if word == ''
  #       initialize
  #     end
  #   end
  # end

  # Get a question from array with #sample.
  def grab_question
    @entry_urls.sample(4)
  end
end
