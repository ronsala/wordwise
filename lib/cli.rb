class Wordwise::CLI

    WIDTH = 70
    EXIT = ["exit", "quit"]

    def call
        introduction
        questions
        goodbye
    end

    def introduction
        puts ''
        puts center("Welcome to WordWise!")
        puts ''
        puts center("Get ready to test your word wisdom....")
        puts ''
    end

    def questions
        question = Wordwise::Question.new
        input = gets.strip.downcase
        case input
            when '1' and definitions[0] == definition_1
                puts 'Correct!'
            when '2' and definitions[1] == definition_1
                puts 'Correct!'
            when '3' and definitions[2] == definition_1
                puts 'Correct!'
            when '4' and definitions[3] == definition_1
                puts 'Correct!'
            else puts 'Incorrect. \n Correct answer: #{definition_1'}
        end
        if input == ''
    end

end