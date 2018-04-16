# Implements interface for user.
class CLI
  attr_accessor :definition, :definitions_s, :origin_1, :question, :word_1
  attr_accessor :num_input

  # Start the program.
  def call
    introduction
    play
  end

  # Display welcome message.
  def introduction
    puts 'WELCOME TO WORDWISE!\n\n'.center
    puts 'You can learn more about the words in this quiz at\n\n'.center
    puts 'https://www.oxforddictionaries.com.\n\n'.center
    puts 'Get ready to test your word wisdom....\n\n'.center
  end

  # Display question and ask for answer.
  def play
    setup_question
    display_question
    ask_no
  end

  # Create new Question object.
  def setup_question
    question = Question.new
    @definition = question.definition_1
    @definitions_s = question.definitions_s
    @word_1 = question.word_1
    @origin_1 = question.origin_1
  end

  # Display the word and shuffled definitions.
  def display_question
    puts "\nWhat does '#{@word_1}' mean?\n\n"
    puts "1) #{@definitions_s[0]}\n\n"
    puts "2) #{@definitions_s[1]}\n\n"
    puts "3) #{@definitions_s[2]}\n\n"
    puts "4) #{@definitions_s[3]}\n\n"
  end

  # Get definition number from user.
  def ask_no
    puts "Please enter a number 1-4:\n\n"
    @num_input = gets.strip
    case input
    when '1'
      if @definitions_s[0] == @definition
        puts "\nCORRECT!"
        ask_letter
      else
        puts "\nINCORRECT.\n\nCORRECT ANSWER: '#{@definition}'\n"
        ask_letter
      end
    when '2'
      if @definitions_s[1] == @definition
        puts 'CORRECT!'
        ask_letter
      else
        puts "\nINCORRECT.\n\nCORRECT ANSWER: '#{@definition}'\n"
        ask_letter
      end
    when '3'
      if @definitions_s[2] == @definition
        puts 'CORRECT!'
        ask_letter
      else
        puts "\nINCORRECT.\n\nCORRECT ANSWER: '#{@definition}'\n"
        ask_letter
      end
    when '4'
      if @definitions_s[3] == @definition
        puts 'CORRECT!'
        ask_letter
      else
        puts "\nINCORRECT.\n\nCORRECT ANSWER: '#{@definition}'\n"
        ask_letter
      end
    else
      ask_input
    end
  end

  # Menu displayed after user has answered a question:

  def ask_letter
    puts "\nWord origin: 'o'. Next question: 'n'. Exit game: 'e'\n"
    input = gets.strip.downcase

    case input
    when 'o'
      if @origin1 != ''
        puts "\n#{@origin_1}\n\n"
      else
        puts "Sorry, no origin available for this word.\n\n"
      end
      ask_n_or_e
    when 'n'
      play
    when 'e'
      goodbye
    else
      ask_letter
    end
  end

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
