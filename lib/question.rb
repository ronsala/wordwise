# Assemble a question consisting of a word and its definition shuffled with 3
# other definitions.
class Wordwise::Question
  attr_accessor :word_1, :definition_1, :definition_2, :definition_3
  attr_accessor :definition_4, :definitions, :length, :origin_1, :word_nos

  # Set instance variables for Question objects.
  def initialize
    @definition = @definition_1
    @defs = [@def_1, @def_2, @def_3, @def_4].shuffle
  end
end
