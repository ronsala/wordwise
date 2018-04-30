# Implements interface for user.
class Wordwise::CLI
  attr_reader :question

  # Display welcome message.
  def introduction
    puts ''
    puts "WELCOME TO WORDWISE!\n".center(80)
    puts "You can learn more about the words in this quiz at https://www.oxforddictionaries.com.\n\n".center(80)
    puts "Get ready to test your word wisdom....\n\n".center(80)
    puts "What category would you like to test your knowledge on?\n\n"
    Wordwise::CLI.display_lists
  end

  # Presents list of categories.
  def self.display_lists
    puts ''
    Wordwise::Scraper.scrape_word_lists.each_with_index do |l, i|
      puts "     #{i + 1}) #{l}"
    end
    Wordwise::CLI.ask_list
  end

  # Asks user for category selection.
  def self.ask_list
    puts "\nPlease enter the number of the category you want:\n"
    input = gets.strip.to_i
    size = Wordwise::Scraper.scrape_word_lists.size
    if input.between?(1, size)
      Wordwise::Scraper.scrape_word_list(input - 1)
    else
      Wordwise::CLI.ask_list
    end
    Wordwise::CLI.play
  end

  # Displays question and asks for answer.
  def self.play
    puts "Loading question...\n\n"
    @question = Wordwise::Question.new
    Wordwise::CLI.display_question
    Wordwise::CLI.ask_no
  end

  # Helper method for .play.
  def self.display_question
    puts "\nWhat does '#{@question.word}' mean?\n\n"
    (0..3).each do |i|
      puts "     #{i + 1}) #{@question.defs[i]}\n\n"
    end
  end

  # Get definition number from user.
  def self.ask_no
    puts "Please enter a number 1-4:\n\n"
    input = gets.strip
    case input
    when '1'
      @question.defs[0] == @question.def ? Wordwise::CLI.correct : Wordwise::CLI.incorrect
    when '2'
      @question.defs[1] == @question.def ? Wordwise::CLI.correct : Wordwise::CLI.incorrect
    when '3'
      @question.defs[2] == @question.def ? Wordwise::CLI.correct : Wordwise::CLI.incorrect
    when '4'
      @question.defs[3] == @question.def ? Wordwise::CLI.correct : Wordwise::CLI.incorrect
    else
      Wordwise::CLI.ask_no
    end
  end

  # Tell user they answered correctly and ask how they want to proceed.
  def self.correct
    puts 'CORRECT!'
    Wordwise::CLI.ask_letter
  end

  # Tell user they answered incorrectly, give correct answer, and ask how they
  # want to proceed.
  def self.incorrect
    puts "\nINCORRECT.\n\nCORRECT ANSWER:\n'#{@question.def}'\n"
    Wordwise::CLI.ask_letter
  end

  # Display menu after user has answered a question.
  def self.ask_letter
    puts "\nWord origin: 'o'. Next question: 'n'. Change category: 'c'. Exit: 'e'.\n"
    input = gets.strip.downcase
    case input
    when 'o'
      puts "\n#{@question.origin}\n\n"
<<<<<<< HEAD
      ask_n_s_or_e
=======
      Wordwise::CLI.ask_n_c_or_e
>>>>>>> workshop
    when 'n'
      Wordwise::CLI.play
    when 'c'
      Wordwise::CLI.display_lists
    when 'e'
      Wordwise::CLI.goodbye
    else
      Wordwise::CLI.ask_letter
    end
  end

  # Display menu after origin has been displayed.
  def self.ask_n_c_or_e
    puts "Next question: 'n'. Change category: 'c'. Exit game: 'e'\n"
    input = gets.strip.downcase
    case input
    when 'n'
      play
    when 'c'
      Wordwise::CLI.display_lists
    when 'e'
      Wordwise::CLI.goodbye
    else
      Wordwise::CLI.ask_n_c_or_e
    end
  end

  # Tells user questions are exhausted in category and gives options.
  def self.ask_c_or_e
    puts 'Sorry, no more questions available in category.'
    puts "Change category: 'c'. Exit: 'e'.\n"
    input = gets.strip.downcase
    case input
    when 'c'
      Wordwise::CLI.display_lists
    when 'e'
      Wordwise::CLI.goodbye
    else
      Wordwise::CLI.ask_c_or_e
    end
  end

  # Bids user farewell and end play.
  def self.goodbye
    puts 'Thanks for playing WordWise! Please come again!'
  end
end
