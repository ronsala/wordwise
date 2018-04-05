require_relative "../lib/question.rb"

class CLI

    # attr_accessor :definitions

    WIDTH = 70

    def call
        introduction
        questions
        # goodbye
    end

    def introduction
        puts center("WELCOME TO WORDWISE!")
        puts center("You can learn more about the words in this quiz at https://www.oxforddictionaries.com.")
        puts center("Get ready to test your word wisdom....")
    end

    def center(str)
        s = " "
        until str.length >= WIDTH
          str.prepend(s)
          str << (s)
        end
        str.prepend("\n")
      end

    def questions
        question = Question.new
        definition = question.definition_1
        definitions_s = question.definitions_s
        # definition = question.definition
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
            puts 'Please enter a number 1-4.'
        end
                # binding.pry
    end
end

cli = CLI.new.call