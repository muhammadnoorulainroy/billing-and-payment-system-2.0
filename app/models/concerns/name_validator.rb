# frozen_string_literal: true

class NameValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    special = "?<>',?[]}{=-)(*+!:@&/|^%$#`~{}"
    regex = /[#{special.gsub(/./) { |char| "\\#{char}" }}]/
    if value&.match?(regex)
      record.errors.add attribute, (options[:message] || 'cannot contain special characters')
    elsif !all_letters(value[0..2])
      record.errors.add attribute, (options[:message] || 'first three characters must be letters')
    end
  end

  def all_letters(str)
    str[/[a-zA-Z]+/] == str
  end
end
