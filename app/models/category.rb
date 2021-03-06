# frozen_string_literal: true

class Category < ApplicationRecord
  validates :name, :description, presence: true

  has_rich_text :description
end
