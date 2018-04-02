class Wordwise::CLI

    WIDTH = 70
    EXIT = ["exit", "quit"]

    def call
        introduction
        questions
        goodbye
    end

    def introduction
        puts ""
        puts center("Welcome to WordWise. Get ready to test your word wisdom!")
        puts ""
    end

    def questions
        question = Question.new
        puts "What does '#{word_1}' mean?"
        puts ""
        puts "1) #{definitions[0]}"
        puts "2) #{definitions[1]}"
        puts "3) #{definitions[2]}"
        puts "4) #{definitions[3]}"
        puts ""
    end

end