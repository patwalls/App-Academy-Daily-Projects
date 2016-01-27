class CreateUserAndPollAndQuestionAndAnswerChoiceAndResponse < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name, null: false
      t.timestamps
    end

    create_table :polls do |t|
        t.string :title, null: false
        t.integer :author_id, null: false
        t.timestamps
    end

    add_foreign_key :polls, :users, column: :author_id

    create_table :questions do |t|
      t.string :text, null: false
      t.integer :poll_id, null: false
      t.timestamps
    end

    add_foreign_key :questions, :polls

    create_table :answer_choices do |t|
      t.string :text, null: false
      t.integer :question_id, null: false
      t.timestamps
    end

    add_foreign_key :answer_choices, :questions

    create_table :responses do |t|
      t.integer :user_id, null: false
      t.integer :answer_choice_id, null: false
      t.timestamps
    end

    add_foreign_key :responses, :users
    add_foreign_key :responses, :answer_choices

    add_index :users, :name
    add_index :polls, [:title, :author_id]
    add_index :questions, [:poll_id, :text]
    add_index :answer_choices, [:question_id, :text]
    add_index :responses, [:user_id, :answer_choice_id]

  end
end
