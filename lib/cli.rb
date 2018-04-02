# class Wordwise::CLI
class CLI

    WIDTH = 70
    EXIT = ["exit", "quit"]

    def call
        introduction
        questions
        goodbye
    end

    def introduction
        puts ''
        puts center("**Welcome to WordWise!**")
        puts ''
        puts center("Get ready to test your word wisdom....")
        puts ''
        puts "*You can learn more about the words in this quiz at oxforddictionaries.com*"
    end

    def questions
        question = Wordwise::Question.new
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

cli = CLI.new