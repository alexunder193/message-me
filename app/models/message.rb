# frozen_string_literal: true

# Message model represents messages table
class Message < ApplicationRecord
  belongs_to :user
  validates :body, presence: true
end
