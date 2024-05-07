# frozen_string_literal: true

class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.integer :pages

      t.timestamps
    end
  end
end
