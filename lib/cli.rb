# Implements interface for user.
class Wordwise::CLI
  WIDTH = 80

  # Display welcome message.
  def introduction
    puts ''
    puts "WELCOME TO WORDWISE!\n".center(80)
    puts "You can learn more about the words in this quiz at https://www.oxforddictionaries.com.\n\n".center(80)
    puts "Get ready to test your word wisdom....\n\n".center(80)
    puts "What category would you like to test your knowledge on?\n"
    display_lists
  end

  # Presents list of categories.
  def display_lists
    puts ''
    Wordwise::Scraper.scrape_word_lists.each_with_index do |l, i|
      puts wrap_indent("#{i + 1}) #{l}")
      puts ''
    end
    ask_list
  end

  # Wraps strings to format them prettily within the default page width.
  def wrap(str)
    str.gsub(/(.{1,#{WIDTH}})(\s+|\Z)/, "\\1\n")
  end

  # As #wrap, with a five space left indent.
  def wrap_indent(str)
    str.gsub(/(.{1,#{WIDTH}})(\s+|\Z)/, "     \\1\n")
  end

  # Asks user for category selection.
  def ask_list
    puts "Please enter the number of the category you want:"
    input = gets.strip.to_i
    size = Wordwise::Scraper.scrape_word_lists.size
    if input.between?(1, size)
      @words_defs_ary = Wordwise::Scraper.scrape_word_list(input - 1)
      check_remaining
    else
      ask_list
    end
  end

    # Checks if there are enough unused words and definitions to form question.
    # Minumum size is set at 5 because sample method in #sample_words_defs
    # is not called on first item in array.
    def check_remaining
      if @words_defs_ary.size >= 5
        sample_words_defs
      else
        ask_c_or_e
      end
  end

  def sample_words_defs
    # Samples starting at index 1 of array to avoid any column headings.
    @question_words_defs = @words_defs_ary[1..@words_defs_ary.size - 1].sample(4)
    # Prevents repetition of words in questions.
    @words_defs_ary.delete_if { |wd| wd == @question_words_defs[0] }
    set_question_words
  end

  # Iterates over array of words and definitions to make separate array of words.
  def set_question_words
    @@question_words = []
    @question_words_defs.each_index do |i|
      @@question_words << @question_words_defs[i][0]
    end
    set_question_defs
  end

  # Iterates over array of words and definitions to make separate array of
  # definitions.
  def set_question_defs
    @@question_defs = []
    @question_words_defs.each_index do |i|
      @@question_defs << @question_words_defs[i][1]
    end
    play
  end

  # Displays question and asks for answer.
  def play
    puts "\nLoading question...\n\n"
    @question = Wordwise::Question.new
    display_question
    ask_no
  end

  def self.get_question_words
    @@question_words
  end

  def self.get_question_array
    origin = Wordwise::Scraper.scrape_entry_pages
    # Array is return value to be used in Question.
    [@@question_words, @@question_defs, origin]
  end

  # Presents a question to the user.
  def display_question
    puts "\nWhat does '#{@question.word}' mean?\n\n"
    (0..3).each do |i|
      puts wrap_indent("#{i + 1}) #{@question.defs[i]}")
      puts ''
    end
    @words_defs_ary.delete_if { |wd| wd == @question_words_defs[0] }
  end

  # Get definition number from user.
  def ask_no
    puts 'Please enter a number 1-4:'
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
    puts "\nCORRECT!"
    ask_letter
  end

  # Tells user they answered incorrectly, gives correct answer, and asks how to 
  # proceed.
  def incorrect
    puts "\nINCORRECT.\n\n"
    puts 'CORRECT ANSWER:'
    puts wrap_indent("'#{@question.def}'")
    ask_letter
  end

  # Display menu after user has answered a question.
  def ask_letter
    puts "\nWord origin: 'o'. Next question: 'n'. Change category: 'c'. Exit: 'e'.\n"
    case_letter
  end

  # Initiates action based on user input.
  def case_letter
    input = gets.strip.downcase
    case input
    when 'o'
      puts "\n#{@question.origin}\n\n"
      ask_n_c_or_e
    when 'n'
      check_remaining
    when 'c'
      display_lists
    when 'e'
      goodbye
    else
      ask_letter
    end
  end

  # Displays menu after origin has been displayed.
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

  def goodbye
    puts wrap("\nThanks for playing WordWise! Would you like to review the words and definitions from your session?")
    puts ''
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
      puts wrap_indent("#{question.def.capitalize}.")
      puts wrap_indent("Origin: #{question.origin}")
    end
    puts ''
    exit
  end

  def exit
    puts "\nPlease come again!\n\n"
  end
end
