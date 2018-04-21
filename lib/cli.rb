# Implements interface for user.
class Wordwise::CLI
  attr_accessor :def, :defs, :origin1, :question, :word
  attr_accessor :num_input, :letter_input, :scraper

  # Start the program.
  def call
    introduction
    play
  end

  # Display welcome message.
  def introduction
    puts "WELCOME TO WORDWISE!\n\n".center(70)
    puts "You can learn more about the words in this quiz at\n\n".center(70)
    puts "https://www.oxforddictionaries.com.\n\n".center(70)
    puts "Get ready to test your word wisdom....\n\n".center(70)
  end

  # Display question and ask for answer.
  def play
    display_question
    ask_no
  end

  # Display the word and shuffled definitions.
  def display_question
    @question = Wordwise::Question.new
    puts "\nWhat does '#{@question.word}' mean?\n\n"
    puts "1) #{question.defs[0]}\n\n"
    puts "2) #{question.defs[1]}\n\n"
    puts "3) #{question.defs[2]}\n\n"
    puts "4) #{question.defs[3]}\n\n"
  end

  # Get definition number from user.
  def ask_no
    puts "Please enter a number 1-4:\n\n"
    @num_input = gets.strip
    case @num_input
    when '1'
      if @defs[0] == @def
        correct
      else
        incorrect
      end
    when '2'
      if @defs[1] == @def
        correct
      else
        incorrect
      end
    when '3'
      if @defs[2] == @def
        correct
      else
        incorrect
      end
    when '4'
      if @defs[3] == @def
        correct
      else
        incorrect
      end
    else
      ask_input
    end
  end

  # Tell user they answered correctly and ask how they want to proceed.
  def correct
    puts 'CORRECT!'
    ask_letter
  end

  # Tell user they answered incorrectly, give correct answer, and ask how they
  # want to proceed.
  def incorrect
    puts "\nINCORRECT.\n\nCORRECT ANSWER: '#{@def}'\n"
    ask_letter
  end

  # Display menu after user has answered a question.
  def ask_letter
    puts "\nWord origin: 'o'. Next question: 'n'. Exit game: 'e'\n"
    letter_input = gets.strip.downcase
    case letter_input
    when 'o'
      puts "\n#{@origin1}\n\n"
      ask_n_or_e
    when 'n'
      play
    when 'e'
      goodbye
    else
      ask_letter
    end
  end

  # Display menu after origin has been displayed.
  def ask_n_or_e
    puts "Next question: 'n'. Exit game: 'e'\n"
    input = gets.strip.downcase
    case input
    when 'n'
      play
    when 'e'
      goodbye
    else
      ask_n_or_e
    end
  end

  # Bid user farewell and end play.
  def goodbye
    puts 'Thanks for playing WordWise! Please come again!'
  end
end
