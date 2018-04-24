# Assemble a question consisting of a word and its definition shuffled with 3
# other definitions.
class Wordwise::Question
  attr_accessor :defs, :def, :def2, :def3, :def4, :word, :scraped, :question_array

  # Set instance variables for Question objects.
  def initialize
    question_array = Wordwise::Scraper.scrape_entry_pages
    @word = question_array[0][0]
    @def = question_array[1][0]
    def2 = defs[0]
    def3 = defs[1]
    def4 = defs[2]
    @defs = question_array[1].shuffle
  end


end
