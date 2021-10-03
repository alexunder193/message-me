# frozen_string_literal: true

# Root controller
class ChatroomController < ApplicationController

  before_action :require_user

  def index
    @messages = Message.all
  end

end
