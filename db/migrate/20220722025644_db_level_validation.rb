# frozen_string_literal: true

class DbLevelValidation < ActiveRecord::Migration[5.2]
  def self.up
    execute 'ALTER TABLE plans ADD CONSTRAINT check_name_length CHECK (LENGTH(name) >=3 and LENGTH(name) <= 20)'
    execute 'ALTER TABLE features ADD CONSTRAINT check_name_length CHECK (LENGTH(name) >=3 and LENGTH(name) <= 20)'
    execute 'ALTER TABLE features ADD CONSTRAINT check_code_length CHECK (LENGTH(code) >=3 and LENGTH(code) <= 6)'
  end

  def self.down
    execute 'ALTER TABLE plans DROP CONSTRAINT check_name_length'
    execute 'ALTER TABLE features DROP CONSTRAINT check_name_length'
    execute 'ALTER TABLE features DROP CONSTRAINT check_code_length'
  end
end
