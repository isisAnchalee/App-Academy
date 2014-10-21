require 'singleton'
require 'sqlite3'
require_relative 'user'
require_relative 'question'
require_relative 'question_follower'
require_relative 'reply'
require_relative 'questions'

class QuestionLike
  
  attr_reader :id
  attr_accessor :user_id, :question_id
  
  def initialize(options = {})
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
  
  def self.find_by_id(id)
    query = <<-SQL
    SELECT 
      * 
    FROM 
      question_likes
    WHERE 
      id = ?
    SQL

    results = QuestionsDatabase.instance.execute(query, id).first
    return nil if results.nil?
    QuestionLike.new(results)
  end
  
  def self.likers_for_question_id(question_id)
    query = <<-SQL
    SELECT 
      users.*
    FROM
      users
    JOIN
      question_likes
    ON
      users.id = question_likes.user_id
    WHERE
      question_likes.question_id = ?
    SQL
    
    results = QuestionsDatabase.instance.execute(query, question_id)
    results.map do |result|
      User.new(result)
    end
  end
  
  def self.num_likes_for_question_id(question_id)
    query = <<-SQL
    SELECT 
      COUNT(*)
    FROM
      users
    JOIN
      question_likes
    ON
      users.id = question_likes.user_id
    WHERE
      question_likes.question_id = ?
    SQL

  results = QuestionsDatabase.instance.execute(query, question_id).first
  results["COUNT(*)"]
  end
  
end