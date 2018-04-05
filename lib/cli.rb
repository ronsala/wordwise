require_relative "../lib/question.rb"

class CLI

    WIDTH = 70

    def call
        introduction
        questions
        goodbye
    end

    def introduction
        puts center("WELCOME TO WORDWISE!")
        puts center("Get ready to test your word wisdom....")
        puts center("You can learn more about the words in this quiz at https://www.oxforddictionaries.com.")
        puts center("One moment while we get your first question....\n")
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
        input = gets.strip.downcase
        case input
        when '1' 
            if definitions[0] == definition_1
                puts 'Correct!'
            end
        when '2' 
            if definitions[1] == definition_1
                puts 'Correct!'
            end
        when '3' 
            if definitions[2] == definition_1
                puts 'Correct!'
            end
        when '4' 
            if definitions[3] == definition_1
                puts 'Correct!'
            end
        else puts 'Incorrect.'
        end
    end
end

cli = CLI.new.call