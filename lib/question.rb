# Assemble a question consisting of a word and its definition shuffled with 3
# other definitions.
class Wordwise::Question
  attr_accessor :defs, :def, :def2, :def3, :def4

  # Set instance variables for Question objects.
  def initialize
    scraper = Wordwise::Scraper.new
    @def = scraper.def
    @word1 = scraper.word
    @origin1 = scraper.origin1
    @defs = [@def, @def2, @def3, @def4].shuffle
  end
end
