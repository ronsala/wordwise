# Assemble a question consisting of a word and its definition shuffled with 3
# other definitions.
class Wordwise::Question
  attr_reader :word, :def, :defs, :origin

  @@all = []

  # Set instance variables for Question objects.
  def initialize
    question_array = Wordwise::CLI.get_question_array
    @word = question_array[0][0]
    @def = question_array[1][0]
    @defs = question_array[1].shuffle
    @origin = question_array[2]
    @@all << self
  end

  def self.all
    @@all
  end
end
