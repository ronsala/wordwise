# Implements interface for user.
class Wordwise::CLI
  attr_accessor :question

  # Start the program.
  def call
    Wordwise::Scraper.scrape_word_lists
    introduction
    play
  end

  # Display welcome message.
  def introduction
    puts "WELCOME TO WORDWISE!\n\n".center(70)
    puts "You can learn more about the words in this quiz at\n\n".center(70)
    puts "https://www.oxforddictionaries.com.\n\n".center(70)
    puts "Get ready to test your word wisdom....\n\n".center(70)
    puts "What word list would you like to test your knowledge on?\n\n"
    Wordwise::Scraper.lists.each_with_index do |l, i|
      puts "     #{i + 1}) #{l}"
    end
    puts "\n\nPlease enter the number of the list you want:\n\n"
    ask_list
  end

  def ask_list
    input = gets.strip.to_i
    size = Wordwise::Scraper.lists.size
    if input.between?(1, size)
      Wordwise::Scraper.scrape_word_list(input - 1)
    else
      puts "Please enter a number 1 - #{size}:\n\n"
      ask_list
    end
  end

  # Display question and ask for answer.
  def play
    @question = Wordwise::Question.new
    display_question
    ask_no
  end

  def display_question
    puts "\nWhat does '#{@question.word}' mean?\n\n"
    (0..3).each do |i|
      puts "#{i + 1}) #{@question.defs[i]}\n\n"
    end
  end

  # Get definition number from user.
  def ask_no
    puts "Please enter a number 1-4:\n\n"
    input = gets.strip
    case input
    when '1'
      @question.defs[0] == @question.def ? correct : incorrect
    when '2'
      @question.defs[1] == @question.def ? correct : incorrect
    when '3'
      @question.defs[2] == @question.def ? correct : incorrect
    when '4'
      @question.defs[3] == @question.def ? correct : incorrect
    else
      ask_no
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
    puts "\nINCORRECT.\n\nCORRECT ANSWER: '#{@question.def}'\n"
    ask_letter
  end

  # Display menu after user has answered a question.
  def ask_letter
    puts "\nWord origin: 'o'. Next question: 'n'. Exit game: 'e'\n"
    input = gets.strip.downcase
    case input
    when 'o'
      puts "\n#{@question.origin}\n\n"
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
