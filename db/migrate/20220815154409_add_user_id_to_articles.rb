# frozen_string_literal: true

class AddUserIdToArticles < ActiveRecord::Migration[7.0]
  def change
    change_table(:articles) do |t|
      t.belongs_to :user, foreign_key: true
    end
  end
end
