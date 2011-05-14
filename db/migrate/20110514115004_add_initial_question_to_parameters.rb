class AddInitialQuestionToParameters < ActiveRecord::Migration
  def self.up
    add_column :parameters, :initial_question, :bool
  end

  def self.down
    remove_column :parameters, :initial_question
  end
end
