# [] Fix problem of word origin sometimes not putsing or giving backup text.
# [] Create new CLI object from wordwise file

require_relative "../lib/question.rb"

# class Wordwise::CLI # Error: "uninitialized constant Wordwise"
class CLI


    attr_accessor :definition, :definitions_s, :origin_1, :question, :word_1

    WIDTH = 70

    def call
        introduction
        play
    end

    def introduction
        puts center("WELCOME TO WORDWISE!")
        puts center("You can learn more about the words in this quiz at https://www.oxforddictionaries.com.")
        puts center("Get ready to test your word wisdom....")
    end

    def play
        setup_question
        display_question
        ask_input
    end

    def center(str)
        s = " "
        until str.length >= WIDTH
          str.prepend(s)
          str << (s)
        end
        str.prepend("\n")
      end

      # Create new Question object:

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

      # Get definition number from user:

      def ask_input
        puts "Please enter a number 1-4:\n\n"
        input = gets.strip
        case input
        when "1"
          if @definitions_s[0] == @definition
            puts "\nCORRECT!"
            menu
          else 
            puts "\nINCORRECT.\n\nCORRECT ANSWER: '#{@definition}'\n"
            menu
          end
        when "2" 
          if @definitions_s[1] == @definition
            puts 'CORRECT!'
            menu
          else 
            puts "\nINCORRECT.\n\nCORRECT ANSWER: '#{@definition}'\n"
            menu
          end
        when "3" 
          if @definitions_s[2] == @definition
            puts 'CORRECT!'
            menu
          else 
            puts "\nINCORRECT.\n\nCORRECT ANSWER: '#{@definition}'\n"
            menu
          end
        when "4" 
          if @definitions_s[3] == @definition
            puts 'CORRECT!'
            menu
          else 
            puts "\nINCORRECT.\n\nCORRECT ANSWER: '#{@definition}'\n"
            menu
          end
        else 
          ask_input
        end
      end
      
      # Menu displayed after user has ANSWERed a question:

      def menu
        puts "\nWord origin: 'o'. Next question: 'n'. Exit game: 'e'\n"
        input = gets.strip.downcase

        case input
        when "o"
          if @origin1 != ""
            puts "\n#{@origin_1}\n\n"
          else
            puts "Sorry, no origin available for this word.\n\n"
          end
          puts "Next question: 'n'. Exit game: 'e'\n"
          input_2 = gets.strip.downcase
          case input_2
          when "n"
            play
          when "e"
            goodbye
          else
            puts "Please enter 'n', or 'e'."
            input_2 = gets.strip.downcase
            case input_2
            when "n"
              play
            when "e"
              goodbye
            else
              puts "Please enter n', or 'e'."
            end
          end
        when "n"
          play
        when "e"
          goodbye
        else 
          menu
        end
      end

      # Bid user farewell and end play.

      def goodbye
        puts "Thanks for playing WordWise! Please come again!"
      end
end

cli = CLI.new.call