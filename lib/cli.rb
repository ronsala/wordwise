require_relative "../lib/question.rb"

class CLI

    attr_accessor :definition, :definitions_s, :origin_1, :question, :word_1

    WIDTH = 70

    def call
        introduction
        play
        # goodbye
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
        puts ''
        puts "What does '#{@word_1}' mean?\n\n"
        puts "1) #{@definitions_s[0]}"
        puts "2) #{@definitions_s[1]}"
        puts "3) #{@definitions_s[2]}"
        puts "4) #{@definitions_s[3]}\n"
      end

      def ask_input
        puts 'Please enter a number 1-4.'
        input = gets.strip
        case input
        when "1"
            if definitions_s[0] == definition
                puts 'Correct!'

            else 
                puts 'Incorrect.'
            end
        when "2" 
            if definitions_s[1] == definition
                puts 'Correct!'
            else 
                puts 'Incorrect.'
            end
        when "3" 
            if definitions_s[2] == definition
                puts 'Correct!'
            else 
                puts 'Incorrect.'
            end
        when "4" 
            if definitions_s[3] == definition
                puts 'Correct!'
            else 
                puts 'Incorrect.'
            end
        else 
            ask_input
        end
      
        def origin_or_next
          puts "For word origin, enter 'o'. For next question, enter 'n'"
                input = gets.strip
                case input
                when "o"
                  puts @origin_1
                when "n"
                  play
                else 
                  puts "Please enter 'o' or 'n'."
                end
        end
        

end

cli = CLI.new.call