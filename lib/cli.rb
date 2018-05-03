# Implements interface for user.
class Wordwise::CLI
  # Display welcome message.
  def introduction
    puts ''
    puts "WELCOME TO WORDWISE!\n".center(80)
    puts "You can learn more about the words in this quiz at https://www.oxforddictionaries.com.\n\n".center(80)
    puts "Get ready to test your word wisdom....\n\n".center(80)
    puts "What category would you like to test your knowledge on?\n\n"
    display_lists
  end

  # Presents list of categories.
  def display_lists
    puts ''
    Wordwise::Scraper.scrape_word_lists.each_with_index do |l, i|
      puts "     #{i + 1}) #{l}"
    end
    ask_list
  end

  # Asks user for category selection.
  def ask_list
    puts "\nPlease enter the number of the category you want:\n"
    input = gets.strip.to_i
    size = Wordwise::Scraper.scrape_word_lists.size
    if input.between?(1, size)
      Wordwise::Scraper.scrape_word_list(input - 1)
    else
      ask_list
    end
    play
  end

  # Displays question and asks for answer.
  def play
    puts "Loading question...\n\n"
    @question = Wordwise::Question.new
    display_question
    ask_no
  end

  # Helper method for #play.
  def display_question
    puts "\nWhat does '#{@question.word}' mean?\n\n"
    (0..3).each do |i|
      puts "     #{i + 1}) #{@question.defs[i]}\n\n"
    end
  end

  def display_all
    puts "\nWordwise::Question.all"
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
    puts "\nINCORRECT.\n\nCORRECT ANSWER:\n'#{@question.def}'\n"
    ask_letter
  end

  # Display menu after user has answered a question.
  def ask_letter
    puts "\nWord origin: 'o'. Next question: 'n'. Change category: 'c'. Exit: 'e'.\n"
    case_letter
  end

  # Display menu after origin has been displayed.
  def ask_n_c_or_e
    puts "Next question: 'n'. Change category: 'c'. Exit game: 'e'\n"
    case_letter
  end

  # Tells user questions are exhausted in category and gives options.
  def ask_c_or_e
    puts 'Sorry, no more questions available in category.'
    puts "Change category: 'c'. Exit: 'e'.\n"
    case_letter
  end

  def case_letter
    input = gets.strip.downcase
    case input
    when 'o'
      puts "\n#{@question.origin}\n\n"
      ask_n_c_or_e
    when 'n'
      play
    when 'c'
      display_lists
    when 'e'
      goodbye
    else
      ask_letter
    end
  end

  def goodbye
    puts "\nThanks for playing WordWise! Would you like to review the words and definitions from your session?"
    case_y_n
  end

  # Bids user farewell and end play.
  def case_y_n
    puts "Yes: 'y'. No: 'n'.\n"
    input = gets.strip.downcase
    case input
    when 'y'
      display_review
    when 'n'
      exit
    else
      case_y_n
    end
  end

  def display_review
    Wordwise::Question.all.each_index do |i|
      question = Wordwise::Question.all[i]
      puts "\n'#{question.word}':"
      puts "  #{question.def.capitalize}."
      puts "  Origin:"
      puts "  #{question.origin}"
    end
    puts ''
  end

  def exit
    puts 'Please come again!'
  end
end
