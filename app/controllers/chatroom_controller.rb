# frozen_string_literal: true

# Root controller
class ChatroomController < ApplicationController

  def index
    @message = Message.new
    @messages = Message.all
  end

end
