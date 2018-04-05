# [] Fix problem of word origin sometimes not putsing or giving backup text.

require_relative "../lib/question.rb"

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

      def setup_question
        question = Question.new
        @definition = question.definition_1
        @definitions_s = question.definitions_s
        @word_1 = question.word_1
        @origin_1 = question.origin_1
      end

      def display_question
        puts "\nWhat does '#{@word_1}' mean?\n\n"
        puts "1) #{@definitions_s[0]}\n\n"
        puts "2) #{@definitions_s[1]}\n\n"
        puts "3) #{@definitions_s[2]}\n\n"
        puts "4) #{@definitions_s[3]}\n\n"
      end

      def ask_input
        puts "Please enter a number 1-4.\n\n"
        input = gets.strip
        case input
        when "1"
          if @definitions_s[0] == @definition
            puts "\nCorrect!"
            menu
          else 
            puts "\nIncorrect. Correct answer: '#{@definition}'\n"
            menu
          end
        when "2" 
          if @definitions_s[1] == @definition
            puts 'Correct!'
            menu
          else 
            puts "\nIncorrect. Correct answer: '#{@definition}'\n"
            menu
          end
        when "3" 
          if @definitions_s[2] == @definition
            puts 'Correct!'
            menu
          else 
            puts "\nIncorrect. Correct answer: '#{@definition}'\n"
            menu
          end
        when "4" 
          if @definitions_s[3] == @definition
            puts 'Correct!'
            menu
          else 
            puts "\nIncorrect. Correct answer: '#{@definition}'\n"
            menu
          end
        else 
          ask_input
        end
      end
      
      def menu
        puts "\nWord origin: 'o'. Next question: 'n'. Exit game: 'e'\n"
        input = gets.strip.downcase
        case input
        when "o"
          if @origin1 != ""
            puts "\n#{@origin_1} \n\n"
          else
            puts "Sorry, no origin available for this word."
          end
          sleep(2)
          play
        when "n"
          play
        when "e"
          goodbye
        else 
          puts "Please enter 'o', 'n', or 'e'."
        end
      end

      def goodbye
        puts "Thanks for playing WordWise! Please come again!"
      end
end

cli = CLI.new.call