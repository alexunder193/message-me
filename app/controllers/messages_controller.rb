# frozen_string_literal: true

# Root controller
class MessagesController < ApplicationController

  before_action :require_user

  def create
    message = current_user.messages.build(message_params)
    return unless message.save

    ActionCable.server.broadcast 'chatroom_channel',
                                 mod_message: message_render(message)
  end

  private

  def message_params
    params.require(:message).permit(:body)
  end

  # Rendering the message partial
  def message_render(message)
    render(partial: 'message', locals: { message: message })
  end

end
