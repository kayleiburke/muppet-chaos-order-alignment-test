class QuizCreator
  def create_quiz
    num_questions = get_num_questions
    get_questions(num_questions)
  end

  def get_outcomes

  end

  def get_num_questions
    instructions = "Please enter the number of questions that you would like to create:"
    puts instructions

    while num_questions = gets.chomp.to_i < 1
      "Invalid input."
      puts instructions
    end
  end

  def get_questions(count)
    questions = []
    instructions = "Please enter a question:"

    count.times do

    end
  end

end