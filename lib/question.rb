# Assemble a question consisting of a word and its definition shuffled with 3
# other definitions.
class Wordwise::Question
  attr_accessor :defs, :def, :def2, :def3, :def4, :word, :scraped, :scraper

  # Set instance variables for Question objects.
  def initialize
    @scraped = Wordwise::CLI.scraper # Throws "undefined method `scraper' for Wordwise::CLI:Class (NoMethodError)"

    scraped_defs = Wordwise::Scraper.scrape_defs
    @def = scraped_defs.def
    @word = scraped_defs.word # Temp:Works
    @origin1 = scraped_defs.origin1
    @defs = [scraped_defs.def, scraped_defs.def2, scraped_defs.def3, scraped_defs.def4].shuffle
  end
end
