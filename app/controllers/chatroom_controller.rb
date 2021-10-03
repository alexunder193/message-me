# frozen_string_literal: true

# Root controller
class ChatroomController < ApplicationController

  def index
    @messages = Message.all
  end

end
