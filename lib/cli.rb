require_relative "../lib/question.rb"

class CLI

    # attr_accessor :definitions

    WIDTH = 70

    def call
        introduction
        questions
        goodbye
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
        definition = question.display_question
        input = gets.strip.downcase
        case input
        when '1' 
            if @definitions[0] == definition
                puts 'Correct!'
            end
        when '2' 
            if @definitions[1] == definition
                puts 'Correct!'
            end
        when '3' 
            if @definitions[2] == definition
                puts 'Correct!'
            end
        when '4' 
            if @definitions[3] == definition
                puts 'Correct!'
            end
        else puts 'Incorrect.'
        end
    end
end

cli = CLI.new.call