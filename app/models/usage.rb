# frozen_string_literal: true

class Usage < ApplicationRecord
  belongs_to :subscription
  belongs_to :feature
end
