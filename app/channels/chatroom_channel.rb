# frozen_string_literal: true

# Chatroom channel
class ChatroomChannel < ApplicationCable::Channel

  def subscribed
    stream_from 'chatroom_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

end
