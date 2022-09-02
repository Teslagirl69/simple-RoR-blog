# frozen_string_literal: true

class AddUserIdToComments < ActiveRecord::Migration[7.0]
  def change
    change_table(:comments) do |t|
      t.belongs_to :user, foreign_key: true
    end
  end
end
